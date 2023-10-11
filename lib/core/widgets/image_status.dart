import 'package:flutter/material.dart';
import 'package:messaging_app/core/consts/enum.dart';

import '../theme/color_manager.dart';
import 'custom_image.dart';

class ImageStatus extends StatelessWidget {
  const ImageStatus({
    Key? key,
    required this.img,
    required this.status,
    this.imgSize = 40,
  }) : super(key: key);

  final String img;
  final UserStatus status;
  final double imgSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipOval(
          child: CustomImage(
            path: img,
            width: imgSize,
            height: imgSize,
          ),
        ),
        if (status != UserStatus.none)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                color: userStatus(
                  status,
                ),
                border: Border.all(
                  width: 1.5,
                  color: ColorManager.whiteColor,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}

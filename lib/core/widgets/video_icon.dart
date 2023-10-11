import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/core/consts/assets.dart';
import 'package:messaging_app/core/theme/color_manager.dart';
import 'package:messaging_app/core/widgets/custom_image.dart';

class VideoIcon extends StatelessWidget {
  const VideoIcon({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: 24,
          height: 24,
          child: Center(
            child: CustomImage(
              path: Assets.videoIcon,
              color: Get.isDarkMode
                  ? ColorManager.whiteColor
                  : ColorManager.hintTextColor,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/core/consts/assets.dart';
import 'package:messaging_app/core/theme/color_manager.dart';
import 'package:messaging_app/core/widgets/custom_image.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomImage(
          path: Assets.menuIcon,
          color: Get.isDarkMode
              ? ColorManager.whiteColor
              : ColorManager.hintTextColor,
        ),
      ),
    );
  }
}

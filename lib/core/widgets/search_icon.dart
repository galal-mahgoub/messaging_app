import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/core/consts/assets.dart';
import 'package:messaging_app/core/services/theme_service.dart';
import 'package:messaging_app/core/widgets/custom_image.dart';

import '../theme/color_manager.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: 24,
            height: 24,
            child: Center(
              child: CustomImage(
                path: Assets.searchIcon,
                color: ThemeService.to.isDark.value
                    ? ColorManager.whiteColor
                    : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

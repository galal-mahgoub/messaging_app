import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/core/consts/assets.dart';
import 'package:messaging_app/core/services/theme_service.dart';
import 'package:messaging_app/core/widgets/custom_image.dart';

import '../theme/color_manager.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: CustomImage(
              path: Assets.searchIcon,
              color:
                  ThemeService.to.isDark.value ? ColorManager.whiteColor : null,
            ),
          ),
        ));
  }
}

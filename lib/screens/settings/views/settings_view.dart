import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/core/consts/demo_data.dart';
import 'package:messaging_app/core/theme/font_manager.dart';

import '../../../core/consts/assets.dart';
import '../../../core/services/theme_service.dart';
import '../../../core/theme/color_manager.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../core/widgets/search_icon.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      init: SettingsController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Settings',
              style: context.textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeightManger.bold,
              ),
            ),
            actions: const [
              SearchIcon(),
            ],
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    ClipOval(
                      child: CustomImage(
                        path: user.img,
                        width: 64,
                        height: 64,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: context.textTheme.headlineLarge,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            user.about,
                            style: context.textTheme.bodySmall!.copyWith(
                              color: ColorManager.hintTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: ColorManager.hintTextColor.withOpacity(.3),
              ),
              SettingListTile(
                icon: Assets.darkModeIcon,
                title: 'Dark mode',
                trailing: Obx(
                  () => Switch(
                    activeColor: ColorManager.mainColor,
                    inactiveThumbColor: ColorManager.hintTextColor.withOpacity(
                      .5,
                    ),
                    activeTrackColor: Get.isDarkMode
                        ? ColorManager.whiteColor.withOpacity(
                            .1,
                          )
                        : ColorManager.mainColor.withOpacity(
                            .1,
                          ),
                    inactiveTrackColor: ColorManager.hintTextColor.withOpacity(
                      .1,
                    ),
                    value: ThemeService.to.isDark.value,
                    onChanged: (value) => ThemeService.to.changeDarkMode(),
                  ),
                ),
              ),
              SettingListTile(
                icon: Assets.rectangleProfileIcon,
                title: 'Account',
              ),
              SettingListTile(
                icon: Assets.notificationIcon,
                title: 'Notification',
              ),
              SettingListTile(
                icon: Assets.messageIcon,
                title: 'Chat settings',
              ),
              SettingListTile(
                icon: Assets.dataStorageIcon,
                title: 'Data and storage',
              ),
              SettingListTile(
                icon: Assets.lockIcon,
                title: 'Privacy and security',
              ),
              SettingListTile(
                icon: Assets.aboutIcon,
                title: 'About',
                trailing: const SizedBox(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SettingListTile extends StatelessWidget {
  const SettingListTile({
    Key? key,
    required this.icon,
    required this.title,
    this.trailing,
  }) : super(key: key);

  final String icon;
  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CustomImage(
            path: icon,
            color: ColorManager.mainColor,
          ),
          const SizedBox(width: 16),
          Expanded(
              child: Text(
            title,
            style: context.textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeightManger.regular,
            ),
          )),
          const SizedBox(width: 16),
          trailing ??
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Get.isDarkMode
                    ? ColorManager.whiteColor.withOpacity(.4)
                    : ColorManager.hintTextColor.withOpacity(.4),
              ),
        ],
      ),
    );
  }
}

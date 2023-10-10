import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/core/consts/assets.dart';

import '../../../core/theme/color_manager.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../core/widgets/menu_icon.dart';
import '../../../core/widgets/video_icon.dart';
import '../controllers/message_details_controller.dart';

class MessageDetailsView extends StatelessWidget {
  const MessageDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageDetailsController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            title: Row(
              children: [
                ClipOval(
                  child: CustomImage(
                    path: Assets.user2Icon,
                    width: 48,
                    height: 48,
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fullsnack Designers',
                      style: context.textTheme.headlineLarge,
                    ),
                    Text(
                      '7 Online, from 12 peoples',
                      style: context.textTheme.bodySmall!.copyWith(
                        color: Get.isDarkMode
                            ? ColorManager.whiteColor.withOpacity(0.5)
                            : ColorManager.hintTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: const [
              VideoIcon(),
              MenuIcon(),
            ],
          ),
        );
      },
    );
  }
}

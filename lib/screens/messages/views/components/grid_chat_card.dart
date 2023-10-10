import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/core/consts/assets.dart';
import 'package:messaging_app/core/routes/app_pages.dart';
import 'package:messaging_app/core/theme/color_manager.dart';
import 'package:messaging_app/core/models/chat_model.dart';
import 'package:messaging_app/core/widgets/custom_image.dart';

import '../../../../core/consts/enum.dart';

class GridChatCard extends StatelessWidget {
  const GridChatCard({
    Key? key,
    required this.chat,
  }) : super(key: key);

  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.messageDetails),
      child: Stack(
        children: [
          Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: chat.unSeenMsgCount <= 0
                  ? const Color(0xFFF7F7F7)
                  : Get.isDarkMode
                      ? Colors.white.withOpacity(.3)
                      : ColorManager.mainColor.withOpacity(.1),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipOval(
                          child: CustomImage(
                            path: chat.senderImg,
                            width: 48,
                            height: 48,
                          ),
                        ),
                        if (chat.senderStatus != UserStatus.none)
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                color: userStatus(
                                  chat.senderStatus,
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
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chat.senderName,
                            style: context.textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    if (chat.isForward) ...[
                      CustomImage(
                        path: Assets.forwardIcon,
                        width: 12,
                        height: 12,
                      ),
                      const SizedBox(width: 4),
                    ],
                    Expanded(
                      child: Text(
                        chat.lastMsg,
                        style: context.textTheme.bodySmall!.copyWith(
                          color: chat.unSeenMsgCount > 0
                              ? Get.isDarkMode
                                  ? Colors.white
                                  : ColorManager.darkBlueColor
                              : ColorManager.hintTextColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (chat.unSeenMsgCount > 0)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: ColorManager.mainColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

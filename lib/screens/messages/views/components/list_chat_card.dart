import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/core/consts/assets.dart';
import 'package:messaging_app/core/theme/color_manager.dart';
import 'package:messaging_app/core/theme/font_manager.dart';
import 'package:messaging_app/core/models/chat_model.dart';
import 'package:messaging_app/core/widgets/custom_image.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../core/routes/app_pages.dart';
import '../../../../core/widgets/image_status.dart';

class ListChatCard extends StatelessWidget {
  const ListChatCard({
    Key? key,
    required this.chat,
  }) : super(key: key);

  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.messageDetails),
      child: Container(
        decoration: chat.unSeenMsgCount <= 0
            ? null
            : ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: Get.isDarkMode
                    ? Colors.white.withOpacity(.3)
                    : ColorManager.mainColor.withOpacity(.1),
              ),
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageStatus(
              img: chat.senderImg,
              status: chat.senderStatus,
              imgSize: 48,
            ),
            const SizedBox(width: 16),
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
                  Row(
                    children: [
                      if (chat.isSeen) ...[
                        CustomImage(
                          path: Assets.seenIcon,
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 4),
                      ],
                      Expanded(
                        child: Text(
                          chat.lastMsg,
                          style: context.textTheme.bodySmall!.copyWith(
                            color: Get.isDarkMode
                                ? Colors.white
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
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  timeago.format(
                    chat.sentDate,
                  ),
                ),
                const SizedBox(height: 8),
                if (chat.unSeenMsgCount > 0)
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorManager.mainColor,
                    ),
                    child: Center(
                      child: Text(
                        chat.unSeenMsgCount.toString(),
                        style: context.textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeightManger.bold,
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

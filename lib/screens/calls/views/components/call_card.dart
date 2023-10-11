import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/core/consts/assets.dart';
import 'package:messaging_app/core/theme/color_manager.dart';
import 'package:messaging_app/core/models/call_model.dart';
import 'package:messaging_app/core/utils/extensions.dart';
import 'package:messaging_app/core/widgets/custom_image.dart';
import 'package:messaging_app/screens/calls/views/components/history_calls_dialog.dart';

import '../../../../core/widgets/image_status.dart';

class CallCard extends StatelessWidget {
  const CallCard({
    Key? key,
    required this.call,
  }) : super(key: key);

  final CallModel call;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.dialog(
        Dialog(
          child: HistoryCallsDialog(
            call: call,
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            ImageStatus(
              img: call.callerImg,
              status: call.callerStatus,
              imgSize: 48,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    call.callerName,
                    style: context.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      CustomImage(
                        path:
                            '${Assets.calledIcon}${call.callType.name}_icon.svg',
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          call.callDate.appDateFormat,
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
            CustomImage(
              path: call.isPhoneCall ? Assets.phoneIcon : Assets.videoIcon,
              width: 24,
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}

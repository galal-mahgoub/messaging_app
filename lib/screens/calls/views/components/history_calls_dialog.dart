import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/core/utils/extensions.dart';

import '../../../../core/consts/assets.dart';
import '../../../../core/theme/color_manager.dart';
import '../../../../core/models/call_model.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/image_status.dart';
import '../../../../core/widgets/menu_icon.dart';
import 'history_call_card.dart';

class HistoryCallsDialog extends StatelessWidget {
  const HistoryCallsDialog({
    Key? key,
    required this.call,
  }) : super(key: key);

  final CallModel call;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
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
              const MenuIcon(),
            ],
          ),
        ),
        Divider(
          color: ColorManager.hintTextColor.withOpacity(.3),
        ),
        ListView.separated(
          shrinkWrap: true,
          itemCount: call.historyCalls.length,
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
            HistoryCallModel historyCall = call.historyCalls[index];
            return HistoryCallCard(
              historyCall: historyCall,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 8);
          },
        )
      ],
    );
  }
}

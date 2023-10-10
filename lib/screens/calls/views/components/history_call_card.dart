import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/core/consts/assets.dart';
import 'package:messaging_app/core/theme/font_manager.dart';
import 'package:messaging_app/core/models/call_model.dart';
import 'package:messaging_app/core/utils/extensions.dart';
import 'package:messaging_app/core/widgets/custom_image.dart';

class HistoryCallCard extends StatelessWidget {
  const HistoryCallCard({
    Key? key,
    required this.historyCall,
  }) : super(key: key);

  final HistoryCallModel historyCall;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          CustomImage(
            path: '${Assets.calledIcon}${historyCall.callType.name}_icon.svg',
            width: 16,
            height: 16,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  historyCall.callDate.appDateFormat,
                  style: context.textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeightManger.regular,
                  ),
                ),
                if (historyCall.callDuration.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    historyCall.callDuration,
                    style: context.textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeightManger.regular,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 16),
          CustomImage(
            path: historyCall.isPhoneCall ? Assets.phoneIcon : Assets.videoIcon,
            width: 24,
            height: 24,
          )
        ],
      ),
    );
  }
}

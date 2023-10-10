import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/core/consts/demo_data.dart';
import 'package:messaging_app/core/models/call_model.dart';

import '../../../core/consts/assets.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../core/widgets/search_icon.dart';
import '../controllers/calls_controller.dart';
import 'components/call_card.dart';

class CallsView extends StatelessWidget {
  const CallsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CallsController>(
      init: CallsController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Recent Calls',
              style: context.textTheme.headlineLarge,
            ),
            actions: const [
              SearchIcon(),
            ],
          ),
          floatingActionButton: InkWell(
            onTap: () {},
            child: Container(
              width: 56,
              height: 56,
              decoration: const ShapeDecoration(
                color: Color(0xFF2F80ED),
                shape: OvalBorder(),
              ),
              child: Center(
                child: CustomImage(
                  path: Assets.addCallIcon,
                ),
              ),
            ),
          ),
          body: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: calls.length,
            itemBuilder: (context, index) {
              CallModel call = calls[index];
              return CallCard(
                call: call,
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
          ),
        );
      },
    );
  }
}

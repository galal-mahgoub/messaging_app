import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/core/consts/assets.dart';
import 'package:messaging_app/core/consts/demo_data.dart';
import 'package:messaging_app/core/models/chat_model.dart';
import 'package:messaging_app/core/widgets/custom_image.dart';
import 'package:messaging_app/screens/messages/controllers/messages_controller.dart';
import 'package:messaging_app/screens/messages/views/components/category_card.dart';
import 'package:messaging_app/screens/messages/views/components/list_chat_card.dart';

import '../../../core/theme/font_manager.dart';
import '../../../core/widgets/search_icon.dart';
import 'components/grid_chat_card.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessagesController>(
      init: MessagesController(),
      builder: (controller) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: Text(
                  'Pinned Chats',
                  style: context.textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeightManger.bold,
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: CustomImage(
                      path: user.img,
                      height: 24,
                      width: 24,
                    ),
                  )
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
                      path: Assets.addMessageIcon,
                    ),
                  ),
                ),
              ),
              body: Column(
                children: [
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 120,
                    ),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: pinnedChats.length,
                    itemBuilder: (context, index) {
                      ChatModel chat = pinnedChats[index];
                      return GridChatCard(
                        chat: chat,
                      );
                    },
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              right: 0,
              left: 0,
              bottom: 0,
              height: controller.showFullRecentChats
                  ? context.height
                  : context.height / 2,
              child: const RecentChats(),
            ),
          ],
        );
      },
    );
  }
}

class RecentChats extends StatelessWidget {
  const RecentChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessagesController>(
      builder: (controller) {
        return GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.dy < 0) {
              controller.showFullRecentChats = true;
            } else {
              controller.showFullRecentChats = false;
            }
            controller.update();
          },
          child: Container(
            decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.black : Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color:
                      Get.isDarkMode ? Colors.white24 : const Color(0x19466086),
                  blurRadius: 32,
                  offset: const Offset(0, -8),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 8),
                Center(
                  child: Container(
                    width: 24,
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xff979797).withOpacity(.3),
                    ),
                  ),
                ),
                if (controller.showFullRecentChats)
                  SizedBox(
                    height: context.mediaQueryPadding.top + 16,
                  ),
                Expanded(
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      title: Text(
                        'Recent Chats',
                        style: context.textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeightManger.bold,
                        ),
                      ),
                      actions: const [
                        SearchIcon(),
                      ],
                    ),
                    body: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8,
                          ),
                          child: SizedBox(
                            height: 28,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: channels.length,
                              itemBuilder: (context, index) {
                                String category = categories[index];
                                return CategoryCard(
                                  onTap: () =>
                                      controller.selectCategory(category),
                                  title: category,
                                  isSelected:
                                      controller.selectedCategory == category,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 32);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(8),
                            itemCount: recentChats.length,
                            itemBuilder: (context, index) {
                              ChatModel chat = recentChats[index];
                              return ListChatCard(
                                chat: chat,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: 16);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

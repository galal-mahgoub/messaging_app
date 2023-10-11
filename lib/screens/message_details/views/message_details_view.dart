import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/core/consts/assets.dart';
import 'package:messaging_app/core/consts/demo_data.dart';
import 'package:messaging_app/core/consts/enum.dart';
import 'package:messaging_app/core/theme/font_manager.dart';

import '../../../core/routes/app_pages.dart';
import '../../../core/theme/color_manager.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../core/widgets/image_status.dart';
import '../../../core/widgets/menu_icon.dart';
import '../../../core/widgets/video_icon.dart';
import '../controllers/message_details_controller.dart';
import 'components/message_container.dart';

class MessageDetailsView extends StatelessWidget {
  const MessageDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageDetailsController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Get.isDarkMode
                ? ColorManager.blackColor
                : ColorManager.whiteColor,
            toolbarHeight: 80,
            title: InkWell(
              onTap: () => Get.toNamed(Routes.groupDescription),
              child: Row(
                children: [
                  ClipOval(
                    child: CustomImage(
                      path: Assets.user2Icon,
                      width: 48,
                      height: 48,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fullsnack Designers',
                          style: context.textTheme.headlineLarge!.copyWith(
                            fontWeight: FontWeightManger.bold,
                          ),
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
                  ),
                ],
              ),
            ),
            actions: const [
              VideoIcon(),
              MenuIcon(),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          children: [
                            MessageContainer(
                              userName: 'Mike Mazowski',
                              isFromOthers: true,
                              message:
                                  'Hello guys, we have discussed about post-corona vacation plan and our decision is to go to Bali. We will have a very big party after this corona ends! These are some images about our destination',
                              isAdmin: true,
                              date: DateTime(
                                2023,
                                1,
                                1,
                                0,
                                16,
                                4,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ImageStatus(
                          img: Assets.user6Icon,
                          status: UserStatus.active,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          children: [
                            MessageContainer(
                              userName: 'Mike Mazowski',
                              isFromOthers: true,
                              message:
                                  'Hello guys, we have discussed about post-corona vacation plan and our decision is to go to Bali. We will have a very big party after this corona ends! These are some images about our destination',
                              isAdmin: true,
                              date: DateTime(
                                2023,
                                1,
                                1,
                                0,
                                16,
                                4,
                              ),
                              images: [
                                Assets.img1,
                                Assets.img2,
                                Assets.img3,
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            MessageContainer(
                              userName: '',
                              isFromOthers: false,
                              message:
                                  'That’s very nice place! you guys made a very good decision. Can’t wait to go on vacation!',
                              isAdmin: false,
                              date: DateTime(
                                2023,
                                1,
                                1,
                                0,
                                16,
                                4,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        ImageStatus(
                          img: Assets.userIcon,
                          status: UserStatus.active,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => controller.showCategories(),
                child: AnimatedContainer(
                  height: controller.isShowingCategories ? 240 : 56,
                  duration: const Duration(milliseconds: 100),
                  decoration: const BoxDecoration(
                    color: ColorManager.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                controller.isShowingCategories
                                    ? 'Channels'
                                    : '# ${controller.selectedChannel.name}',
                                style:
                                    context.textTheme.headlineMedium!.copyWith(
                                  color: controller.isShowingCategories
                                      ? ColorManager.darkBlueColor
                                      : ColorManager.mainColor,
                                  fontWeight: FontWeightManger.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Center(
                                child: CustomImage(
                                  path: controller.isShowingCategories
                                      ? Assets.arrowDownIcon
                                      : Assets.arrowUpIcon,
                                  color: ColorManager.mainColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            InkWell(
                              onTap: () {},
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: Center(
                                  child: CustomImage(
                                    path: Assets.menuIcon,
                                    color: ColorManager.mainColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ...channels
                          .map(
                            (channel) => InkWell(
                              onTap: () => controller.selectChannel(channel),
                              child: Container(
                                color: controller.selectedChannel == channel
                                    ? ColorManager.mainColor.withOpacity(.1)
                                    : null,
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  '# ${channel.name}',
                                  style: context.textTheme.headlineMedium!
                                      .copyWith(
                                    color: controller.selectedChannel == channel
                                        ? ColorManager.mainColor
                                        : ColorManager.hintTextColor,
                                    fontWeight: FontWeightManger.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList()
                    ],
                  ),
                ),
              ),

              // Text Message
              Container(
                color: ColorManager.whiteColor,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: Center(
                          child: CustomImage(
                            path: Assets.emojiIcon,
                            color: ColorManager.hintTextColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        style: context.textTheme.headlineSmall!.copyWith(
                          color: ColorManager.blackColor,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Write a message...',
                          hintStyle: context.textTheme.headlineSmall!.copyWith(
                            color: ColorManager.hintTextColor,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: Center(
                          child: CustomImage(
                            path: Assets.attechIcon,
                            color: ColorManager.hintTextColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF2F80ED),
                          shape: OvalBorder(),
                        ),
                        child: Center(
                          child: CustomImage(
                            path: Assets.micIcon,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

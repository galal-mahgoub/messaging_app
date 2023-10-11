import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/core/consts/assets.dart';
import 'package:messaging_app/core/theme/font_manager.dart';

import '../../../core/consts/enum.dart';
import '../../../core/theme/color_manager.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../core/widgets/image_status.dart';
import '../../../core/widgets/menu_icon.dart';
import '../controllers/group_description_controller.dart';

class GroupDescriptionView extends StatelessWidget {
  const GroupDescriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroupDescriptionController>(
      builder: (controller) {
        return Scaffold(
          body: ListView(
            children: [
              /// Header
              Container(
                color: ColorManager.whiteColor,
                child: Column(
                  children: [
                    ClipPath(
                      clipper: CustomShapeClipper(),
                      child: SizedBox(
                        width: context.width,
                        child: CustomImage(
                          path: Assets.groupImg,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BackButton(
                          color: Get.isDarkMode
                              ? ColorManager.blackColor
                              : ColorManager.whiteColor,
                        ),
                        Text(
                          'Fullsnack Designers',
                          style: context.textTheme.headlineLarge!.copyWith(
                            fontWeight: FontWeightManger.bold,
                            color:
                                Get.isDarkMode ? ColorManager.blackColor : null,
                          ),
                        ),
                        MenuIcon(
                          color:
                              Get.isDarkMode ? ColorManager.blackColor : null,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 32,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImage(
                            path: Assets.circleExclamationMarkIcon,
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              'We are fullsnack designers, yes. From food, for food, by food!',
                              style: TextStyle(
                                color: Get.isDarkMode
                                    ? ColorManager.blackColor
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 32,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomImage(
                            path: Assets.outlineNotificationIcon,
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              'Notifications',
                              style: TextStyle(
                                color: Get.isDarkMode
                                    ? ColorManager.blackColor
                                    : null,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Switch(
                            activeColor: ColorManager.mainColor,
                            inactiveThumbColor:
                                ColorManager.hintTextColor.withOpacity(
                              .5,
                            ),
                            activeTrackColor: Get.isDarkMode
                                ? ColorManager.whiteColor.withOpacity(
                                    .1,
                                  )
                                : ColorManager.mainColor.withOpacity(
                                    .1,
                                  ),
                            inactiveTrackColor:
                                ColorManager.hintTextColor.withOpacity(
                              .1,
                            ),
                            value: controller.allowNotifications,
                            onChanged: (value) =>
                                controller.changeNotification(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              /// Sections
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(16),
                child: IntrinsicHeight(
                  child: Row(
                    children: List.generate(
                      controller.sections.length,
                      (index) {
                        Map<String, dynamic> section =
                            controller.sections[index];
                        return Row(
                          children: [
                            IntrinsicWidth(
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () => controller.changeSection(
                                      section['label'],
                                    ),
                                    child: Row(
                                      children: [
                                        CustomImage(
                                          path: section['icon'],
                                          color: controller.selectedSection ==
                                                  section['label']
                                              ? ColorManager.mainColor
                                              : Get.isDarkMode
                                                  ? ColorManager.whiteColor
                                                  : ColorManager.hintTextColor,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          section['label'],
                                          style: TextStyle(
                                            color: controller.selectedSection ==
                                                    section['label']
                                                ? ColorManager.mainColor
                                                : Get.isDarkMode
                                                    ? ColorManager.whiteColor
                                                    : ColorManager
                                                        .hintTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (controller.selectedSection ==
                                      section['label'])
                                    const Divider(
                                      endIndent: 16,
                                      indent: 16,
                                      thickness: 3,
                                      color: ColorManager.mainColor,
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 32)
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'The next thing we will consider is how to create our own kitchen set in our office!..',
                      ),
                    ),
                    const SizedBox(width: 16),
                    CustomImage(
                      path: Assets.arrowRightIcon,
                      color: Get.isDarkMode
                          ? ColorManager.whiteColor
                          : ColorManager.hintTextColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Pls keep a note that we will take a vacation on next weekend. Make sure you join the eve...',
                      ),
                    ),
                    const SizedBox(width: 16),
                    CustomImage(
                      path: Assets.arrowRightIcon,
                      color: Get.isDarkMode
                          ? ColorManager.whiteColor
                          : ColorManager.hintTextColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'The event will be held in London. Sunday, 26th of April 2020. ',
                      ),
                    ),
                    const SizedBox(width: 16),
                    CustomImage(
                      path: Assets.arrowRightIcon,
                      color: Get.isDarkMode
                          ? ColorManager.whiteColor
                          : ColorManager.hintTextColor,
                    ),
                  ],
                ),
              ),

              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    SizedBox(
                      height: 40,
                      width: context.width,
                      child: const Center(
                        child: Text(
                          'See more',
                          style: TextStyle(
                            color: ColorManager.mainColor,
                            fontWeight: FontWeightManger.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFECECEC)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomImage(
                      path: Assets.channelsIcon,
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        '4 Channels',
                        style: TextStyle(
                          color: ColorManager.blackColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    CustomImage(
                      path: Assets.arrowDownIcon,
                      width: 16,
                      height: 16,
                      color: ColorManager.hintTextColor,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFECECEC)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomImage(
                            path: Assets.peoplesIcon,
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 16),
                          const Expanded(
                            child: Text(
                              '12 Peoples',
                              style: TextStyle(
                                color: ColorManager.blackColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          CustomImage(
                            path: Assets.addPeopleIcon,
                            width: 24,
                            height: 24,
                            color: ColorManager.mainColor,
                          ),
                          const SizedBox(width: 16),
                          CustomImage(
                            path: Assets.searchIcon,
                            width: 24,
                            height: 24,
                            color: ColorManager.mainColor,
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: ColorManager.hintTextColor.withOpacity(.3),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ImageStatus(
                            img: Assets.userIcon,
                            status: UserStatus.active,
                          ),
                          const SizedBox(width: 16),
                          const Expanded(
                            child: Text(
                              'Adina Nurrahma',
                              style: TextStyle(
                                color: ColorManager.darkBlueColor,
                                fontWeight: FontWeightManger.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'You',
                            style: context.textTheme.headlineSmall!.copyWith(
                              color: ColorManager.hintTextColor.withOpacity(.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ImageStatus(
                            img: Assets.user6Icon,
                            status: UserStatus.active,
                          ),
                          const SizedBox(width: 16),
                          const Expanded(
                            child: Text(
                              'Mike Mazowski',
                              style: TextStyle(
                                color: ColorManager.darkBlueColor,
                                fontWeight: FontWeightManger.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: ColorManager.mainColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Admin',
                              style: context.textTheme.headlineSmall!.copyWith(
                                color: ColorManager.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ImageStatus(
                            img: Assets.user4Icon,
                            status: UserStatus.active,
                          ),
                          const SizedBox(width: 16),
                          const Expanded(
                            child: Text(
                              'Marvin Robertson',
                              style: TextStyle(
                                color: ColorManager.darkBlueColor,
                                fontWeight: FontWeightManger.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: ColorManager.mainColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Admin',
                              style: context.textTheme.headlineSmall!.copyWith(
                                color: ColorManager.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ImageStatus(
                            img: Assets.user7Icon,
                            status: UserStatus.active,
                            imgSize: 40,
                          ),
                          const SizedBox(width: 16),
                          const Expanded(
                            child: Text(
                              'Gregory Robertson',
                              style: TextStyle(
                                color: ColorManager.darkBlueColor,
                                fontWeight: FontWeightManger.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 100.0);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 50.0,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

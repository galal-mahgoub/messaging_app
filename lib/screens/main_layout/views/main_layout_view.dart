import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/core/theme/color_manager.dart';

import '../../../core/widgets/custom_image.dart';
import '../controllers/main_layout_controller.dart';

class MainLayoutView extends StatelessWidget {
  const MainLayoutView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainLayoutController>(
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex,
            onTap: (value) => controller.setIndex = value,
            // backgroundColor: Colors.white,
            selectedItemColor: ColorManager.mainColor,
            selectedLabelStyle:
                context.textTheme.headlineMedium?.copyWith(fontSize: 14.0),
            unselectedItemColor: Colors.black,
            unselectedLabelStyle:
                context.textTheme.headlineMedium?.copyWith(fontSize: 14.0),
            items: List.generate(
              controller.bottomNavBarItems.length,
              (index) => BottomNavigationBarItem(
                label: '',
                icon: CustomImage(
                  path: controller.bottomNavBarItems[index]['icon'],
                  color: controller.currentIndex == index
                      ? ColorManager.mainColor
                      : Colors.grey,
                ),
              ),
            ),
          ),
          body: controller.bottomNavBarItems
              .elementAt(controller.currentIndex)['view'],
        );
      },
    );
  }
}

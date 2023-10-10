import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/screens/messages/views/messages_view.dart';

import '../../../core/consts/assets.dart';
import '../../calls/views/calls_view.dart';
import '../../settings/views/settings_view.dart';

class MainLayoutController extends GetxController {
  List<Map<String, dynamic>> bottomNavBarItems = [
    {
      'icon': Assets.messageIcon,
      'view': const MessagesView(),
    },
    {
      'icon': Assets.clockIcon,
      'view': const SizedBox(),
    },
    {
      'icon': Assets.callIcon,
      'view': const CallsView(),
    },
    {
      'icon': Assets.circleProfileIcon,
      'view': const SettingsView(),
    },
  ];

  bool isLoading = false;
  int currentIndex = 0;

  set setIndex(int value) {
    if (currentIndex != value) {
      currentIndex = value;

      update();
    }
  }
}

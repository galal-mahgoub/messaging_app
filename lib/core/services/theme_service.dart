import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeService extends GetxService {
  static ThemeService get to => Get.find();

  Rx<bool> isDark = Rx(false);

  Future<ThemeService> init() async {
    return this;
  }

  changeDarkMode() {
    isDark.value = !isDark.value;

    Get.changeThemeMode(
      !isDark.value ? ThemeMode.light : ThemeMode.dark,
    );
  }
}

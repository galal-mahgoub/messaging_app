import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/routes/app_pages.dart';
import 'core/services/theme_service.dart';
import 'core/theme/theme_manager.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() async {
  await Get.putAsync(
    () => ThemeService().init(),
  );

  runApp(const MainApp());

  timeago.setLocaleMessages('en', MyCustomMessages());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "messaging_app",
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}

// my_custom_messages.dart
class MyCustomMessages implements timeago.LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'now';
  @override
  String aboutAMinute(int minutes) => '$minutes';
  @override
  String minutes(int minutes) => '$minutes';
  @override
  String aboutAnHour(int minutes) => '$minutes';
  @override
  String hours(int hours) => hours == 24 ? 'Yestarday' : '${hours}h';
  @override
  String aDay(int hours) => hours == 24 ? 'Yestarday' : '${hours}h';
  @override
  String days(int days) => '${days}d';
  @override
  String aboutAMonth(int days) => '${days}d';
  @override
  String months(int months) => '${months}mo';
  @override
  String aboutAYear(int year) => '${year}y';
  @override
  String years(int years) => '${years}y';
  @override
  String wordSeparator() => ' ';
}

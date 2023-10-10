import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData get lightTheme => ThemeData(
      fontFamily: FontConstants.fontFamily,

      /// Main Color
      scaffoldBackgroundColor: ColorManager.scaffoldColor,
      brightness: Brightness.light,

      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        iconTheme: IconThemeData(color: ColorManager.hintTextColor),
        elevation: 0,
        titleTextStyle: TextStyle(
          color: ColorManager.darkBlueColor,
          fontSize: 18,
          fontWeight: FontWeightManger.medium,
        ),
      ),

      /// Text Theme
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: ColorManager.darkBlueColor,
          fontSize: 18,
          fontWeight: FontWeightManger.medium,
        ),
        headlineMedium: TextStyle(
          color: ColorManager.darkBlueColor,
          fontSize: 14,
          fontWeight: FontWeightManger.medium,
        ),
        headlineSmall: TextStyle(
          color: ColorManager.darkBlueColor,
          fontSize: 12,
          fontWeight: FontWeightManger.medium,
        ),
        bodySmall: TextStyle(
          color: ColorManager.whiteColor,
          fontSize: 12,
          fontWeight: FontWeightManger.regular,
        ),
      ),
    );

ThemeData get darkTheme => ThemeData(
      fontFamily: FontConstants.fontFamily,

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
      ),

      /// Main Color
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        iconTheme: IconThemeData(color: ColorManager.whiteColor),
        elevation: 0,
        titleTextStyle: TextStyle(
          color: ColorManager.darkBlueColor,
          fontSize: 18,
          fontWeight: FontWeightManger.medium,
        ),
      ),

      /// Text Theme
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: ColorManager.whiteColor,
          fontSize: 18,
          fontWeight: FontWeightManger.medium,
        ),
        headlineMedium: TextStyle(
          color: ColorManager.whiteColor,
          fontSize: 14,
          fontWeight: FontWeightManger.medium,
        ),
        headlineSmall: TextStyle(
          color: ColorManager.whiteColor,
          fontSize: 12,
          fontWeight: FontWeightManger.medium,
        ),
        bodySmall: TextStyle(
          color: ColorManager.whiteColor,
          fontSize: 12,
          fontWeight: FontWeightManger.regular,
        ),
      ),
    );

import 'package:flutter/material.dart';

import 'appColor.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColor.white,
      unselectedItemColor: AppColor.blackColor,
    ),
  );
}

import 'package:flutter/material.dart';

import 'appColor.dart';
import 'app_styles.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColor.white,
      unselectedItemColor: AppColor.blackColor,
    ),
    // textTheme: TextTheme(
    //   headlineLarge: AppStyles.bold16White,
    // ),
    appBarTheme: AppBarTheme(
        backgroundColor: AppColor.bgIcon,
        centerTitle: true,
        titleTextStyle: AppStyles.bold16White.copyWith(
          color: AppColor.primary,
        ),
        iconTheme: IconThemeData(

          color: AppColor.primary,)

    ),
  );
}

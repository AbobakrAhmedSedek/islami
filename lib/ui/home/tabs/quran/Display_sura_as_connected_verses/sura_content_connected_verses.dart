import 'package:flutter/material.dart';
import 'package:islami/utils/appColor.dart';
import 'package:islami/utils/app_styles.dart';

class suraContentConnectedVerses extends StatelessWidget {
  String suraContent;

  suraContentConnectedVerses({super.key, required this.suraContent});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Text(
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      suraContent,
      style: AppStyles.bold24Black.copyWith(
        fontSize: 20,
        color: AppColor.primary,
      ),
    );
  }
}

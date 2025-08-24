import 'package:flutter/material.dart';
import 'package:islami/utils/appColor.dart';
import 'package:islami/utils/app_styles.dart';

class SuraContentVersePerLine extends StatelessWidget {
  String suraContent;

  int index;

  SuraContentVersePerLine({
    super.key,
    required this.suraContent,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: .02 * height),
      decoration: BoxDecoration(
        color: AppColor.bgIcon,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.primary, width: 2),
      ),
      child: Text(
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        " $suraContent [${index + 1}] ",
        style: AppStyles.bold24Black.copyWith(
          fontSize: 20,
          color: AppColor.primary,
        ),
      ),
    );
  }
}

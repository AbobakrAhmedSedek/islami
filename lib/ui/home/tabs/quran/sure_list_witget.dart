import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/quran/quran_resoures.dart';
import 'package:islami/utils/appAssets.dart';
import 'package:islami/utils/app_styles.dart';

class SuraListWitget extends StatelessWidget {
  int index = 0; // This should be passed or defined based on your logic
  SuraListWitget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // This should be passed or defined based on your logic
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      // margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AppImages.vector),
              Text(
                "${index + 1}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
          Column(
            children: [
              Text(
                QuranResources.englishQuranSuraList[index],
                style: AppStyles.bold16White.copyWith(fontSize: 20),
              ),
              Text(
                "${QuranResources.versesNumberList[index]} Verses ",
                style: AppStyles.bold16White,
              ),
            ],
          ),
          Spacer(),
          Text(
            QuranResources.arabicQuranList[index],
            style: AppStyles.bold16White.copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

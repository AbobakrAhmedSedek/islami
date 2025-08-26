import 'package:flutter/material.dart';
import 'package:islami/utils/appColor.dart';
import 'package:islami/utils/app_styles.dart';

import '../../../../utils/appAssets.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angle = 0;
  int counter = 0;
  int tasbehIndex = 0;
  List<String> tasbeh = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;

    return Container(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            // crossAxisAlignment:  CrossAxisAlignment.center,
            // spacing:16,
            children: [
              SizedBox(height: height * 0.05),
              Text(
                "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
                style: AppStyles.bold32Black,
              ),
              SizedBox(height: height * 0.05),
              Image.asset(
                alignment: Alignment.centerRight,
                AppImages.sebhaHead,
                width: width * 0.3,
                height: height * 0.1,
              ),
              GestureDetector(
                onTap: () {
                  incrementCounter();
                },
                child: Transform.rotate(
                  angle: angle,
                  child: Image.asset(
                    AppImages.sebhaBody,
                    width: width * 0.88,
                    height: height * 0.40,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(),
              SizedBox(height: height * 0.2),
              Text(
                tasbeh[tasbehIndex],
                style: AppStyles.bold32Black.copyWith(color: AppColor.white),
              ),
              SizedBox(height: height * 0.01),
              Text(
                "$counter",
                style: AppStyles.bold32Black.copyWith(color: AppColor.white),
              ),

            ],
          ),
        ],
      ),
    );
  }

  void incrementCounter() {
    setState(() {
      angle += .5;
      counter++;
      angle += 0.5;
      if (counter == 34) {
        counter = 0;
        tasbehIndex++;
        if (tasbehIndex == tasbeh.length) {
          tasbehIndex = 0;
        }
      }
    });
  }


}

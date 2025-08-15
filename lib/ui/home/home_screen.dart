import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/ui/home/tabs/quran/quran_tab.dart';
import 'package:islami/ui/home/tabs/radio/radio_tab.dart';
import 'package:islami/ui/home/tabs/sebha/sebha_tab.dart';
import 'package:islami/ui/home/tabs/time/time_tab.dart';
import 'package:islami/utils/appColor.dart';

import '../../utils/appAssets.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> bgImages = [
    AppImages.quranBg,
    AppImages.hadethBg,
    AppImages.sebhaBg,
    AppImages.radioBg,
    AppImages.timeBg,
  ];
  List<Widget> tabNames = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          bgImages[selectedIndex],
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            showSelectedLabels: true,

            backgroundColor: AppColor.primary,
            items: [
              BottomNavigationBarItem(
                icon: buildItemInBottomNavBar(index: 0, image: AppIcons.quran),
                label: 'quran',
              ),
              BottomNavigationBarItem(
                icon: buildItemInBottomNavBar(index: 1, image: AppIcons.hadeth),
                label: 'hadeth',
              ),
              BottomNavigationBarItem(
                icon: buildItemInBottomNavBar(index: 2, image: AppIcons.sebha),
                label: 'sebha',
              ),
              BottomNavigationBarItem(
                icon: buildItemInBottomNavBar(index: 3, image: AppIcons.radio),
                label: 'radio',
              ),
              BottomNavigationBarItem(
                icon: buildItemInBottomNavBar(index: 4, image: AppIcons.time),
                label: 'time',
              ),
            ],
          ),
          body: tabNames[selectedIndex],
        ),
      ],
    );
  }

  Widget buildItemInBottomNavBar({required int index, required String image}) {
    return selectedIndex == index
        ? Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          decoration: BoxDecoration(
            color: AppColor.bgIcon,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ImageIcon(AssetImage(image)),
        )
        : ImageIcon(AssetImage(image));
    // }
  }
} //

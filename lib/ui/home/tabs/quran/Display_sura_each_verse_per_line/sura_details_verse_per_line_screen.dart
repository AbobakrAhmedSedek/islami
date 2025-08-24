import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/home/tabs/quran/Display_sura_each_verse_per_line/sura_content_verse_per_line.dart';
import 'package:islami/ui/home/tabs/quran/quran_resoures.dart';
import 'package:islami/utils/appAssets.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/most_recent_provider.dart';
import '../../../../../utils/appColor.dart';
import '../../../../../utils/app_styles.dart';

class SuraDetailsVersePerLineScreen extends StatefulWidget {
  static const String routeName = '/SuraDetailsVersePerLineScreen';

  const SuraDetailsVersePerLineScreen({super.key});

  @override
  State<SuraDetailsVersePerLineScreen> createState() =>
      _SuraDetailsVersePerLineScreenState();
}

class _SuraDetailsVersePerLineScreenState
    extends State<SuraDetailsVersePerLineScreen> {
  late MostRecentListProvider provider;
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    provider = Provider.of<MostRecentListProvider>(context);
    var args = ModalRoute.of(context)!.settings.arguments as int;
    if (verses.isEmpty) {
      loadSuraFilesEachVerseInALine(args);
    }
    return Scaffold(
      appBar: AppBar(title: Text(QuranResources.englishQuranSuraList[args])),
      body: Container(
        color: AppColor.bgIcon,
        padding: EdgeInsets.symmetric(horizontal: width * .04),

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AppImages.cornerStart,
                  color: AppColor.primary,
                  height: height * 0.1,
                  width: width * 0.2,
                ),
                Text(
                  QuranResources.arabicQuranList[args],
                  style: AppStyles.bold16White.copyWith(
                    color: AppColor.primary,
                    fontSize: height * 0.03,
                  ),
                ),
                Image.asset(
                  AppImages.cornerEnd,
                  color: AppColor.primary,
                  height: height * 0.1,
                  width: width * 0.2,
                ),
              ],
            ),

            Expanded(
              child:
                  verses.isEmpty
                      ? Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primary,
                        ),
                      )
                      : ListView.separated(
                        itemBuilder: (context, index) {
                          return SuraContentVersePerLine(
                            suraContent: verses[index],
                            index: index,
                          );
                          // Text(
                          //   verses[args],
                          //   style: AppStyles.bold14Black.copyWith(
                          //     color: AppColor.primary,
                          //     fontSize: height * 0.02,
                          //   ),
                          // );
                        },
                        itemCount: verses.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: height * 0.01);
                        },
                      ),
            ),
            Image.asset(AppImages.imgBottomDecoration),
          ],
        ),
      ),
    );
  }

  dispose() {
    super.dispose();
    provider.refreshMostRecentIndicesList();
  }

  void loadSuraFilesEachVerseInALine(int args) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/${args + 1}.txt',
    );
    List<String> suraLines = fileContent.split("\n");
    verses = suraLines;
    Future.delayed(Duration(seconds: 4));
    setState(() {});
  }
}

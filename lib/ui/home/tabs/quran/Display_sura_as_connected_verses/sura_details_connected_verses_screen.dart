import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/home/tabs/quran/Display_sura_as_connected_verses/sura_content_connected_verses.dart';
import 'package:islami/ui/home/tabs/quran/quran_resoures.dart';
import 'package:islami/utils/appAssets.dart';

import '../../../../../utils/appColor.dart';
import '../../../../../utils/app_styles.dart';

class SuraDetailsConnectedVersesScreen extends StatefulWidget {
  static const String routeName = '/SuraDetailsConnectedVersesScreen';

  SuraDetailsConnectedVersesScreen({Key? key}) : super(key: key);

  @override
  State<SuraDetailsConnectedVersesScreen> createState() =>
      _SuraDetailsConnectedVersesScreenState();
}

class _SuraDetailsConnectedVersesScreenState
    extends State<SuraDetailsConnectedVersesScreen> {
  String suraContent = "";

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    var args = ModalRoute.of(context)!.settings.arguments as int;
    if (suraContent.isEmpty) {
      loadSuraFilesAsVersesConnectedToEachOther(args);
    }
    return Scaffold(
      appBar: AppBar(title: Text(QuranResources.englishQuranSuraList[args])),
      body: Container(
        color: AppColor.bgIcon,

        //padding: EdgeInsets.symmetric(horizontal: width * .04),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.12,
              // width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AppImages.cornerStart,
                    color: AppColor.primary,
                    height: height * 0.2,
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
                    height: height * 0.2,
                    width: width * 0.2,
                  ),
                ],
              ),
            ),

            Expanded(
              child:
                  suraContent.isEmpty
                      ? Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primary,
                        ),
                      )
                      : SingleChildScrollView(
                        child: suraContentConnectedVerses(
                          suraContent: suraContent,
                        ),
                      ),
            ),
            Image.asset(AppImages.imgBottomDecoration),
          ],
        ),
      ),
    );
  }

  void loadSuraFilesAsVersesConnectedToEachOther(int args) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/${args + 1}.txt',
    );
    List<String> suraLines = fileContent.split("\n");
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += "{ ${i + 1} } "; // Append verse number to each line
    }
    suraContent = suraLines.join();
    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}

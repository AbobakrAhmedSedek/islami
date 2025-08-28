import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/quran/quran_resoures.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/most_recent_provider.dart';
import '../../../../../utils/appAssets.dart';
import '../../../../../utils/appColor.dart';
import '../../../../../utils/app_styles.dart';
import '../Display_sura_each_verse_per_line/sura_details_verse_per_line_screen.dart';

class MostRecentWidget extends StatefulWidget {
  const MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();
}

class _MostRecentWidgetState extends State<MostRecentWidget> {
  late MostRecentListProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.refreshMostRecentIndicesList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    provider = Provider.of<MostRecentListProvider>(context);
    return Visibility(
      visible: provider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Most Recently", style: AppStyles.bold16White),
          SizedBox(height: height * 0.01),
          SizedBox(
            height: .16 * height,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: width * 0.02);
              },
              itemBuilder: (context, index) {
                final suraIndex = provider.mostRecentList[index];

                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      SuraDetailsVersePerLineScreen.routeName, // نفس اسم route
                      arguments: suraIndex, // ✅ نبعت رقم السورة
                    );
                  },
                  child:
                  // onTap: () {
                  //   Navigator.push(context, MaterialPageRoute(
                  //     builder: (_) =>
                  //         SuraDetailsVersePerLineScreen(index: suraIndex,),
                  //   ),
                  //   );
                  // },
                  // child:
                  Container(
                    height: .16 * height,
                    width: .65 * width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColor.primary,
                    ),

                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                QuranResources.englishQuranSuraList[provider
                                    .mostRecentList[index]],
                                style: AppStyles.bold24Black,
                              ),
                              Text(
                                QuranResources.arabicQuranList[provider
                                    .mostRecentList[index]],
                                style: AppStyles.bold24Black,
                              ),
                              SizedBox(height: height * 0.01),
                              Text(
                                "${QuranResources.versesNumberList[provider.mostRecentList[index]]} verses ",
                                style: AppStyles.bold14Black,
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: Image.asset(AppImages.mostRecently)),
                      ],
                    ),
                  ),
                );
              },
              itemCount: provider.mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }
}

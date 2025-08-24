import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/quran/quran_resoures.dart';
import 'package:islami/ui/home/tabs/quran/widget/most_recent_witget.dart';
import 'package:islami/ui/home/tabs/quran/widget/sure_list_witget.dart';
import 'package:provider/provider.dart';

import '../../../../providers/most_recent_provider.dart';
import '../../../../utils/appAssets.dart';
import '../../../../utils/appColor.dart';
import '../../../../utils/app_styles.dart';
import 'Display_sura_each_verse_per_line/sura_details_verse_per_line_screen.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterIndicesList = List.generate(114, (index) => index);
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery
        .of(context)
        .size
        .height;
    final double width = MediaQuery
        .of(context)
        .size
        .width;
    var provider = Provider.of<MostRecentListProvider>(context);

    return Scrollbar(
      controller: _scrollController,
      radius: const Radius.circular(10),
      thickness: 6,
      interactive: true,

      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        semanticChildCount: filterIndicesList.length,
        controller: _scrollController,
        slivers: [

          SliverPersistentHeader(
            pinned: true,
            delegate: _SearchHeaderDelegate(
              minHeight: 70,
              maxHeight: 70,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 6),
                margin: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: 4),
                child: TextField(
                  onChanged: (value) {
                    filterListByValue(value);
                  },
                  style: AppStyles.bold16White,
                  cursorColor: AppColor.primary,
                  cursorErrorColor: AppColor.primary,
                  decoration: InputDecoration(
                    hintText: 'Sura Name',
                    hintStyle: AppStyles.bold16White,
                    filled: true,
                    fillColor: AppColor.bgIcon,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColor.primary, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColor.primary, width: 2),
                    ),
                    prefixIcon: ImageIcon(
                      AssetImage(AppIcons.iconSearch),
                      color: AppColor.primary,
                    ),
                  ),
                ),
              ),
            ),
          ),


          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.02),
                  MostRecentWidget(),
                  SizedBox(height: height * 0.02),
                  Text("Suras List", style: AppStyles.bold16White),
                  SizedBox(height: height * 0.01),
                ],
              ),
            ),
          ),


          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        provider.saveMostRecentIndicesList(
                            filterIndicesList[index]);
                        Navigator.of(context).pushNamed(
                          SuraDetailsVersePerLineScreen.routeName,
                          arguments: filterIndicesList[index],
                        );
                      },
                      child: SuraListWitget(index: filterIndicesList[index]),
                    ),
                    Divider(
                      color: AppColor.white,
                      thickness: 1,
                      endIndent: width * .09,
                      indent: width * .09,
                    ),
                  ],
                );
              },
              childCount: filterIndicesList.length,
            ),
          ),
        ],
      ),
    );
  }

  void filterListByValue(value) {
    List<int> filterList = [];
    for (int i = 0; i < QuranResources.arabicQuranList.length; i++) {
      if (QuranResources.arabicQuranList[i].contains(value)) {
        filterList.add(i);
      } else if (QuranResources.englishQuranSuraList[i]
          .toLowerCase()
          .contains(value.toLowerCase())) {
        filterList.add(i);
      }
    }
    filterIndicesList = filterList;
    setState(() {});
  }
}


class _SearchHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SearchHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_SearchHeaderDelegate oldDelegate) {
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child;
  }
}

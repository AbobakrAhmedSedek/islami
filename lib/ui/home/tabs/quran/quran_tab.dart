import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/quran/sure_list_witget.dart';

import '../../../../utils/appAssets.dart';
import '../../../../utils/appColor.dart';
import '../../../../utils/app_styles.dart';
import 'Display_sura_as_connected_verses/sura_details_connected_verses_screen.dart';

class QuranTab extends StatelessWidget {
  QuranTab({super.key});

  List<int> filterIndicesList = List.generate(114, (index) => index,);

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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            cursorColor: AppColor.primary,
            decoration: InputDecoration(
              hintText: 'Sura Name',
              hintStyle: AppStyles.bold16White,
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
          SizedBox(height: height * 0.02),
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
                return Container(
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
                            Text("Al-Anbiya", style: AppStyles.bold24Black),
                            Text("الأنبياء", style: AppStyles.bold24Black),
                            SizedBox(height: height * 0.01),
                            Text("112 Verses", style: AppStyles.bold14Black),
                          ],
                        ),
                      ),
                      Expanded(child: Image.asset(AppImages.mostRecently)),
                    ],
                  ),
                );
              },
              itemCount: 5,
            ),
          ),
          SizedBox(height: height * 0.02),
          Text("Suras List", style: AppStyles.bold16White),
          SizedBox(height: height * 0.01),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColor.white,
                  thickness: 1,
                  endIndent: width * .09,
                  indent: width * .09,
                );
              },
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          SuraDetailsConnectedVersesScreen.routeName,
                          arguments: index);
                    },
                    child: SuraListWitget(index: index));
              },
              itemCount:
              filterIndicesList
                  .length, // Total number of Suras in the Quran
            ),
          ),
        ],
      ),
    );
  }
}

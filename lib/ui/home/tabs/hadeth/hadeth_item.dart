import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/utils/appColor.dart';
import 'package:islami/utils/app_styles.dart';

import '../../../../model/hadeth_model.dart';
import '../../../../utils/appAssets.dart';

class HadethItem extends StatefulWidget {
  final int index;

  HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  HadethModel? hadethModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadethFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      //
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child:
          hadethModel == null
              ? Center(child: CircularProgressIndicator(color: AppColor.bgIcon))
              : Stack(
                children: [
                  Image.asset(
                    AppImages.hadithCard,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height * .02,
                      horizontal: width * .02,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.04),
                        Text(
                          hadethModel?.title ?? "",
                          textAlign: TextAlign.center,
                          style: AppStyles.bold24Black.copyWith(fontSize: 21),
                        ),
                        SizedBox(height: height * 0.05),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              textAlign: TextAlign.center,
                              hadethModel?.content ?? "",
                              style: AppStyles.bold24Black.copyWith(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }

  Future<void> loadHadethFile(int index) async {
    String fileContent = await rootBundle.loadString(
      "assets/files/Hadeeth/h${index}.txt",
    );
    String title = fileContent.substring(0, fileContent.indexOf("\n"));
    String content = fileContent.substring(fileContent.indexOf("\n") + 1);
    hadethModel = HadethModel(content: content, title: title);
    setState(() {});
  }
}

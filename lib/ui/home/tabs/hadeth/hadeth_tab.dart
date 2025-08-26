import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'hadeth_item.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return CarouselSlider(
      options: CarouselOptions(
        reverse: true,
        autoPlay: true,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        height: height * .7,
      ),
      items:
          List.generate(50, (index) => index + 1).map((index) {
            return HadethItem(index: index);
          }).toList(),
    );
  }
}

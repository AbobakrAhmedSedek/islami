import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:islami/model/onboarding_model.dart';
import 'package:islami/style/colorManager.dart';
import 'package:islami/ui/onboarding_screen/widgets/ondoarding_item.dart';

import '../../style/res/assets_res.dart';
import '../home/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = '/onboarding';

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(AssetsRes.ISLAMI, width: width * 0.8),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemBuilder:
                    (BuildContext context, int index) => OndoardingItem(
                      onboardingModel: OnboardingModel.getOnboardingData[index],
                    ),
                itemCount: OnboardingModel.getOnboardingData.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentPage == 0
                      ? const SizedBox(width: 64)
                      : TextButton(
                        onPressed: () {
                          pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          setState(() {
                            currentPage--;
                          });
                        },
                        child: Text(
                          "back",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorManager.primary,
                          ),
                        ),
                      ),
                  DotsIndicator(
                    dotsCount: OnboardingModel.getOnboardingData.length,
                    position: currentPage.toDouble(),
                    decorator: DotsDecorator(
                      activeColor: ColorManager.primary,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      if (currentPage ==
                          OnboardingModel.getOnboardingData.length - 1) {
                        Navigator.pushReplacementNamed(
                          context,
                          HomeScreen.routeName,
                        );
                        return;
                      }
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                      setState(() {
                        currentPage++;
                      });
                    },
                    child: Text(
                      currentPage ==
                              OnboardingModel.getOnboardingData.length - 1
                          ? "finish"
                          : "next",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorManager.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

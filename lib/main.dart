import 'package:flutter/material.dart';
import 'package:islami/style/colorManager.dart';
import 'package:islami/ui/home/home_screen.dart';
import 'package:islami/ui/onboarding_screen/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: ColorManager.blackColor,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        '/': (context) => const OnboardingScreen(),


      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:islami/providers/most_recent_provider.dart';
import 'package:islami/ui/home/home_screen.dart';
import 'package:islami/ui/home/tabs/quran/Display_sura_as_connected_verses/sura_details_connected_verses_screen.dart';
import 'package:islami/ui/home/tabs/quran/Display_sura_each_verse_per_line/sura_details_verse_per_line_screen.dart';
import 'package:islami/ui/onboarding_screen/onboarding_screen.dart';
import 'package:islami/utils/appTheme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => MostRecentListProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsConnectedVersesScreen.routeName:
            (context) => SuraDetailsConnectedVersesScreen(),
        SuraDetailsVersePerLineScreen.routeName:
            (context) => SuraDetailsVersePerLineScreen(),
        '/': (context) => const OnboardingScreen(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:islami/core/themes/theme_data.dart';
import 'package:islami/features/home/home_screen.dart';
import 'package:islami/features/onboarding/onboarding_screen.dart';
import 'package:islami/features/quran/quran_details.dart';
import 'package:islami/features/splash/splash_screen.dart';

import 'features/hadith/hadith_details.dart';
import 'features/hadith/hadith_screen.dart';
import 'features/sebha/sebha_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        QuranDetails.routeName: (context) => const QuranDetails(),
        HadithScreen.routeName: (context) => const HadithScreen(),
        HadithDetails.routeName: (context) => const HadithDetails(),
        SebhaScreen.routeName: (context) => const SebhaScreen(),
      },
      darkTheme: AppThemeData.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}

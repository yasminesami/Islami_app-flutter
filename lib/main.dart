import 'package:flutter/material.dart';
import 'package:islami/core/themes/theme_data.dart';
import 'package:islami/features/home/home_screen.dart';
import 'package:islami/features/onboarding/onboarding_screen.dart';
import 'package:islami/features/quran/quran_details.dart';
import 'package:islami/features/splash/splash_screen.dart';

void main() => runApp(MyApp());

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
      },
      darkTheme: AppThemeData.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:islami/features/home/home_screen.dart';
import 'package:islami/features/onboarding/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkFirstLaunch();
  }

  Future<void> checkFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('first_launch') ?? true;

    await Future.delayed(const Duration(seconds: 3));

    if (isFirstLaunch) {
      await prefs.setBool('first_launch', false);
      navigateToScreen(const OnboardingScreen());
    } else {
      navigateToScreen(const HomeScreen());
    }
  }

  void navigateToScreen(Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/Splash Screen.png',
      fit: BoxFit.fill,
    );
  }
}

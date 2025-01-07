import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/features/home/home_screen.dart';

import 'onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "onboarding";

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnBoardingContent> contents = [
    OnBoardingContent(
      image: 'assets/images/onboarding1.png',
      title: 'Welcome To Islami App',
      description: ' ',
    ),
    OnBoardingContent(
      image: 'assets/images/onboarding2.png',
      title: 'Welcome To Islami',
      description: 'We Are Very Excited To Have You In Our Community',
    ),
    OnBoardingContent(
      image: 'assets/images/onboarding3.png',
      title: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
    ),
    OnBoardingContent(
      image: 'assets/images/onboarding4.png',
      title: 'Bearish',
      description: 'Praise the name of your Lord, the Most High',
    ),
    OnBoardingContent(
      image: 'assets/images/onboarding5.png',
      title: 'Holy Quran Radio',
      description:
          'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/islami_header.png',
                  width: 291,
                  height: 151,
                )
              ],
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemCount: contents.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          contents[index].image,
                          height: 200,
                          color: AppColors.gold,
                        ),
                        const SizedBox(height: 40),
                        Text(
                          contents[index].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.gold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          contents[index].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.gold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Text(
                      _currentPage == 0 ? '' : 'Back',
                      style: TextStyle(color: AppColors.gold),
                    ),
                  ),
                  // Dot indicators
                  Row(
                    children: List.generate(
                      contents.length,
                      (index) => buildDot(index),
                    ),
                  ),
                  // Next button
                  TextButton(
                    onPressed: () {
                      if (_currentPage == contents.length - 1) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: Text(
                      _currentPage == contents.length - 1 ? 'Finish' : 'Next',
                      style: TextStyle(color: AppColors.gold),
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

  Container buildDot(int index) {
    return Container(
      height: 10,
      width: _currentPage == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: _currentPage == index ? AppColors.gold : AppColors.gray,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

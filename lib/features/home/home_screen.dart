import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/features/hadith/hadith_screen.dart';
import 'package:islami/features/quran/quran_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  final List<Widget> pages = [
    QuranScreen(),
    HadithScreen(),
    Center(child: Text('Radio Screen', style: TextStyle(fontSize: 24))),
    Center(child: Text('Time Screen', style: TextStyle(fontSize: 24))),
  ];

  final List<String> pagesBackground = [
    'assets/images/quraan_bg.png',
    'assets/images/hadeth_bg.png',
    'assets/images/sebha_bg.png',
    'assets/images/radio_bg.png',
    'assets/images/time_bg.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(pagesBackground[currentPage]),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: IndexedStack(
          index: currentPage,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          backgroundColor: AppColors.gold,
          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.black,
          showUnselectedLabels: false,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              currentPage = index;
            });
          },
          items: [
            _buildNavigationBarItem(
              iconPath: 'assets/icons/quran_icon.png',
              label: "Quran",
            ),
            _buildNavigationBarItem(
              iconPath: 'assets/icons/hadith_icon.png',
              label: "Hadith",
            ),
            _buildNavigationBarItem(
              iconPath: 'assets/icons/sebha_icon.png',
              label: "Sebha",
            ),
            _buildNavigationBarItem(
              iconPath: 'assets/icons/radio_icon.png',
              label: "Radio",
            ),
            _buildNavigationBarItem(
              iconPath: 'assets/icons/time_icon.png',
              label: "Time",
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem({
    required String iconPath,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        iconPath,
        width: 24,
        height: 24,
        color: AppColors.black,
      ),
      label: label,
      activeIcon: Container(
        height: 34,
        width: 59,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(66),
          color: AppColors.bottomAppBarContainer,
        ),
        child: Image.asset(
          iconPath,
          color: AppColors.white,
        ),
      ),
    );
  }
}

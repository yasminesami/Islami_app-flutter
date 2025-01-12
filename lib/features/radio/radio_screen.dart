import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/features/radio/radio_containers.dart';
import 'package:islami/features/radio/reciters_containers.dart';

class RadioScreen extends StatefulWidget {
  static const routeName = "radio screen";

  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
        child: Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Image.asset(
          'assets/images/islami_header.png',
          width: screenWidth * .8,
          height: screenHeight * .2,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _currentPage = 0;
              });
            },
            child: Container(
              alignment: Alignment.center,
              width: screenWidth * .46,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color:
                      _currentPage == 0 ? AppColors.gold : Color(0xB3202020)),
              child: Text(
                "Radio",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color:
                        _currentPage == 0 ? AppColors.black : AppColors.white),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _currentPage = 1;
              });
            },
            child: Container(
              alignment: Alignment.center,
              width: screenWidth * .46,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color:
                      _currentPage == 1 ? AppColors.gold : Color(0xB3202020)),
              child: Text(
                "Reciters",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color:
                        _currentPage == 1 ? AppColors.black : AppColors.white),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 16,
      ),
      Expanded(
        child: _currentPage == 0
            ? const RadioContainers()
            : const RecitersContainers(),
      ),
    ]));
  }
}

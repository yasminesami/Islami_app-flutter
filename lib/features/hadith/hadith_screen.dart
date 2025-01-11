import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/features/hadith/model/hadith_model.dart';

import 'hadith_details.dart';

class HadithScreen extends StatefulWidget {
  static const routeName = "hadithScreen";

  const HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  final PageController _pageController = PageController(
    viewportFraction: 0.7,
    initialPage: 0,
  );

  static List<HadithModel> hadithList = [];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (hadithList.isEmpty) {
      loadHadithFile();
    }
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Image.asset(
              'assets/images/islami_header.png',
              width: screenWidth * .8,
              height: screenHeight * .2,
            ),
          ),
          const SizedBox(height: 16),
          if (hadithList.isNotEmpty) // التحقق من أن القائمة ليست فارغة
            SizedBox(
              height: screenHeight * .6,
              child: CarouselSlider.builder(
                itemCount: hadithList.length,
                itemBuilder: (context, index, realIndex) => InkWell(
                  onTap: () => Navigator.of(context).pushNamed(
                    HadithDetails.routeName,
                    arguments: hadithList[index],
                  ),
                  child: Container(
                    alignment: Alignment.topCenter,
                    height: screenHeight * 0.6,
                    width: screenWidth * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.gold,
                      image: const DecorationImage(
                        image:
                            AssetImage('assets/images/hadith_container_bg.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        textDirection: TextDirection.rtl,
                        children: [
                          Text(
                            hadithList[index].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Text(
                                hadithList[index].content.join('\n'),
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                options: CarouselOptions(
                  height: screenHeight * .8,
                  enlargeCenterPage: true,
                  viewportFraction: .7,
                ),
              ),
            )
          else // عرض مؤشر تحميل أثناء انتظار البيانات
            CircularProgressIndicator(
              color: AppColors.black,
            ),
        ],
      ),
    );
  }

  void loadHadithFile() async {
    for (int i = 1; i <= 50; i++) {
      String hadithContent =
          await rootBundle.loadString('assets/Hadeeth/h$i.txt');
      List<String> hadithLines = hadithContent.split('\n');
      String title = hadithLines[0];
      hadithLines.removeAt(0);
      HadithModel hadithModel = HadithModel(title: title, content: hadithLines);
      hadithList.add(hadithModel);
      setState(() {});
    }
  }
}

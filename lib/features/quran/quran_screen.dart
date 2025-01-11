import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/features/quran/quran_details.dart';

import 'models/sura_lists.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 16, right: 16),
      child: Column(
        children: [
          Image.asset(
            'assets/images/islami_header.png',
            width: screenWidth * .8,
            height: screenHeight * .2,
          ),
          TextFormField(
            style: TextStyle(color: AppColors.white),
            cursorColor: AppColors.gold,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xB3202020),
              prefixIcon: Image.asset(
                'assets/icons/quran_icon.png',
                color: AppColors.gold,
              ),
              hintStyle: TextStyle(color: AppColors.white),
              hintText: "Sura Name",
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.gold)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.gold)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.gold)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Most Recently",
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 150,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.gold,
                      ),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "suraNameEn",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              Text(
                                "suraNameAr",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              Text(
                                "Verses",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              )
                            ],
                          ),
                          Image.asset('assets/images/most_recently_img.png')
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      width: 8,
                    ),
                itemCount: 2),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Suras list",
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  itemBuilder: (context, index) => InkWell(
                        onTap: () => Navigator.pushNamed(
                            context, QuranDetails.routeName,
                            arguments: index),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                        'assets/icons/sura_list_icon.png'),
                                    Text(
                                      "${index + 1}",
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${SuraLists.englishQuranSurahs[index]}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: AppColors.white),
                                    ),
                                    Text(
                                      "${SuraLists.AyaNumber[index]} Versus",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: AppColors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              "${SuraLists.arabicAuranSuras[index]}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: AppColors.white),
                            ),
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => Divider(
                        indent: 40,
                        endIndent: 40,
                      ),
                  itemCount: SuraLists.AyaNumber.length))
        ],
      ),
    );
  }
}

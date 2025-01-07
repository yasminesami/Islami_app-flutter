import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_colors.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 16, right: 16),
      child: Column(
        children: [
          Image.asset(
            'assets/images/islami_header.png',
            width: 291,
            height: 171,
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.gold,
                      ),
                      width: 200,
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      width: 8,
                    ),
                itemCount: 2),
          )
        ],
      ),
    );
  }
}

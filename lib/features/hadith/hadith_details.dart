import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/features/hadith/model/hadith_model.dart';

class HadithDetails extends StatelessWidget {
  static const routeName = 'hadith details';

  const HadithDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final HadithModel hadithModel =
        ModalRoute.of(context)?.settings.arguments as HadithModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          hadithModel.title,
          style: TextStyle(
            color: AppColors.gold,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            "assets/images/sura_details_bg.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              const SizedBox(height: 40),
              Text(
                hadithModel.title,
                style: TextStyle(
                  color: AppColors.gold,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: hadithModel.content.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Text(
                        hadithModel.content[index],
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 20, height: 2, color: AppColors.gold),
                      ),
                    ),
                  );
                },
              )),
            ],
          ),
        ],
      ),
    );
  }
}

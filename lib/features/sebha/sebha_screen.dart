import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/features/sebha/models/sebha_model.dart';

class SebhaScreen extends StatefulWidget {
  static const routeName = 'sebha screen';

  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;
  int sebhaIndex = 0;
  double rotationAngle = 0;

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
        Text(
          "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
          style: TextStyle(
              color: AppColors.white,
              fontSize: 38,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
        ),
        InkWell(
          onTap: () => setState(() {
            counter++;
            if (counter == 33) {
              sebhaIndex++;
              counter = 0;
              if (sebhaIndex == SebhaModel.sebhaAzkar.length) {
                sebhaIndex = 0;
              }
            }
            rotationAngle += pi / 2;
          }),
          splashColor: Colors.transparent, // إزالة تأثير الضغط
          highlightColor: Colors.transparent,
          child: Stack(children: [
            Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 60,
                    ),
                    Image.asset('assets/images/sebha_part.png'),
                  ],
                )),
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 74,
                  ),
                  Transform.rotate(
                    angle: rotationAngle,
                    child: Image.asset(
                      'assets/images/SebhaBody.png',
                      height: screenHeight * .44,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(
                    height: 220,
                  ),
                  Text(
                    SebhaModel.sebhaAzkar[sebhaIndex],
                    style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '$counter',
                    style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  )
                ],
              ),
            )
          ]),
        )
      ]),
    );
  }
}

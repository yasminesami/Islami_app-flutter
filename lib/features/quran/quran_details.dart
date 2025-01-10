import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/features/quran/models/sura_lists.dart';

class QuranDetails extends StatelessWidget {
  static const routeName = "quranDetails";
  static List<int> recentSura = [];

  const QuranDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final int suraIndex = ModalRoute.of(context)?.settings.arguments as int;
    recentSura.add(suraIndex);

    Future<List<String>> _getSuraContent(int index) async {
      try {
        String content = await DefaultAssetBundle.of(context)
            .loadString('assets/Suras/${index + 1}.txt');

        List<String> verses = content
            .split('\n')
            .where((line) => line.trim().isNotEmpty)
            .toList();

        // دمج الآيات مع إضافة رقم الآية بشكل تصاعدي
        String combinedVerses = verses.asMap().entries.map((entry) {
          int verseNumber = entry.key + 1;
          return '${entry.value}($verseNumber)';
        }).join(' ');

        return ['$combinedVerses'];
      } catch (e) {
        print("Error reading file: $e");
        return [];
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          SuraLists.arabicAuranSuras[suraIndex],
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
                SuraLists.arabicAuranSuras[suraIndex],
                style: TextStyle(
                  color: AppColors.gold,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: FutureBuilder<List<String>>(
                  future: _getSuraContent(suraIndex),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child:
                              CircularProgressIndicator(color: AppColors.gold));
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                          child: Text(
                        'لا يوجد محتوى',
                        style: TextStyle(color: AppColors.gold),
                      ));
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              snapshot.data![index],
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  fontSize: 20,
                                  height: 2,
                                  color: AppColors.gold),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

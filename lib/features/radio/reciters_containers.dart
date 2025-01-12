import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/features/radio/model/reciters_list.dart';

class RecitersContainers extends StatefulWidget {
  const RecitersContainers({super.key});

  @override
  State<RecitersContainers> createState() => _RecitersContainersState();
}

class _RecitersContainersState extends State<RecitersContainers> {
  late List<bool> playStates;
  late List<bool> volumeStates;

  @override
  void initState() {
    super.initState();
    int itemCount = RecitersList.recitersList.length;
    playStates = List<bool>.generate(itemCount, (index) => false);
    volumeStates = List<bool>.generate(itemCount, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: RecitersList.recitersList.length,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.gold,
          image: DecorationImage(
            alignment: Alignment.bottomCenter,
            image: playStates[index]
                ? const AssetImage('assets/images/selected_container_bg.png')
                : const AssetImage('assets/images/unselected_cotainer_bg.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              RecitersList.recitersList[index],
              style: TextStyle(
                fontSize: 20,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 66,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      playStates[index] = !playStates[index];
                    });
                  },
                  child: playStates[index]
                      ? const ImageIcon(
                          AssetImage('assets/icons/play_audio_icon.png'),
                        )
                      : const ImageIcon(
                          AssetImage('assets/icons/stop_audio_icon.png'),
                        ),
                ),
                const SizedBox(
                  width: 16,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      volumeStates[index] = !volumeStates[index];
                    });
                  },
                  child: volumeStates[index]
                      ? const ImageIcon(
                          AssetImage('assets/icons/mute_volume_icon.png'),
                        )
                      : const ImageIcon(
                          AssetImage('assets/icons/volume_icon.png'),
                        ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

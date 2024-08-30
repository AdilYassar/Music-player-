import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/component/songAndVolume.dart';
import 'package:music_player/component/song_header.dart';
import 'package:music_player/component/song_tile.dart';
import 'package:music_player/component/tranding_song.dart';
import 'package:music_player/controller/cloudSongController.dart';
import 'package:music_player/controller/songPlayerController.dart';
import 'package:music_player/controller/songdatacontroller.dart';
import 'package:music_player/model/mySongModel.dart';
import 'package:music_player/pages/play_song_page.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    SongDataController songDataController = Get.put(SongDataController());
    Songplayercontroller songplayercontroller = Get.put(Songplayercontroller());
    CloudSongController cloudSongController = Get.put(CloudSongController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const SongPageHeader(),
              const SizedBox(
                height: 20,
              ),
              const TrendingSongSlider(),
              const SizedBox(
                height: 40.0,
              ),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          songDataController.isDeviceSong.value = false;
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          decoration: BoxDecoration(
                            color: songDataController.isDeviceSong.value
                                ? const Color.fromARGB(255, 245, 245, 211)
                                : const Color.fromARGB(255, 63, 86, 169),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Cloud Songs",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: songDataController.isDeviceSong.value
                                        ? const Color.fromARGB(255, 63, 86, 169)
                                        : const Color.fromARGB(
                                            255, 245, 245, 211),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          songDataController.isDeviceSong.value = true;
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          decoration: BoxDecoration(
                            color: songDataController.isDeviceSong.value
                                ? const Color.fromARGB(255, 63, 86, 169)
                                : const Color.fromARGB(255, 245, 245, 211),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Device Songs",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: songDataController.isDeviceSong.value
                                        ? const Color.fromARGB(
                                            255, 245, 245, 211)
                                        : const Color.fromARGB(
                                            255, 63, 86, 169),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  )),
              const SizedBox(
                height: 5.0,
              ),
              Obx(
                () => songDataController.isDeviceSong.value
                    ? Column(
                        children: songDataController.localSongList.value
                            .map((e) => SongTile(
                                  onPress: () {
                                    songplayercontroller.playLocalAudio(e);
                                    songDataController
                                        .findCurrentPlayingSongId(e.id);
                                    Get.to(SongAndVolume());
                                  },
                                  songName: e.title,
                                ))
                            .toList())
                    : Column(
                        children: cloudSongController.cloudSongList
                            .map((e) => SongTile(
                                  onPress: () {
                                    songplayercontroller.playCloudAudio(e);
                                    songDataController
                                        .findCurrentPlayingSongId(e.id!);
                                    Get.to(SongAndVolume());
                                  },
                                  songName: e.title!,
                                ))
                            .toList(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

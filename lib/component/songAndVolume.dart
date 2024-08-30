import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/config/colors.dart';
import 'package:music_player/controller/songPlayerController.dart';
import 'package:music_player/controller/songdatacontroller.dart';

class SongAndVolume extends StatefulWidget {
  const SongAndVolume({super.key});

  @override
  State<SongAndVolume> createState() => _SongAndVolumeState();
}

class _SongAndVolumeState extends State<SongAndVolume> {
  double _volumeValue = 50;
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    SongDataController songDataController = Get.put(SongDataController());
    final Songplayercontroller songplayercontroller = Get.find();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Column(
                      children: [
                        const Icon(
                          Icons.music_note,
                          size: 80,
                          color: Colors.blue,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Now Playing',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          '${songplayercontroller.currentSongTitle.value}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 30),
                Obx(() {
                  final duration = songplayercontroller.player.duration;
                  final position = songplayercontroller.player.position;

                  double max = duration?.inSeconds.toDouble() ?? 0;
                  double currentPosition = position.inSeconds.toDouble();
                  currentPosition = currentPosition.clamp(0, max);

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            songplayercontroller.currentTime.value,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Slider(
                              value: currentPosition,
                              min: 0,
                              max: max,
                              divisions: max > 0 ? max.toInt() : null,
                              label: '${currentPosition.toInt()}s',
                              onChanged: (value) {
                                setState(() {
                                  _sliderValue = value;
                                });
                                songplayercontroller
                                    .changeDurationToSecond(value.toInt());
                              },
                              activeColor: Colors.blue,
                              inactiveColor: Colors.blue.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            songplayercontroller.totalTime.value,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.skip_previous),
                      iconSize: 40,
                      color: Colors.blue,
                      onPressed: () {
                        songDataController.playPreviousSong();
                      },
                    ),
                    Obx(
                      () => IconButton(
                        icon: Icon(
                          songplayercontroller.isPlaying.value
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                        iconSize: 60,
                        color: Colors.blue,
                        onPressed: () {
                          if (songplayercontroller.isPlaying.value) {
                            songplayercontroller.pausePlaying();
                          } else {
                            songplayercontroller.resumePlaying();
                          }
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next),
                      iconSize: 40,
                      color: Colors.blue,
                      onPressed: () {
                        songDataController.playNextSong();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 0,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.blue,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 40,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.settings),
              color: Colors.blue,
              onPressed: () {},
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(
                  () => IconButton(
                    icon: Icon(
                      songplayercontroller.isShuffled.value
                          ? Icons.shuffle
                          : Icons.shuffle_outlined,
                    ),
                    iconSize: 30,
                    color: songplayercontroller.isShuffled.value
                        ? Colors.blue
                        : label_color,
                    onPressed: () {
                      songplayercontroller.playRandomSong();
                    },
                  ),
                ),
                Obx(
                  () => IconButton(
                    icon: Icon(
                      songplayercontroller.isLoop.value
                          ? Icons.repeat
                          : Icons.repeat_one,
                    ),
                    iconSize: 30,
                    color: songplayercontroller.isLoop.value
                        ? Colors.blue
                        : label_color,
                    onPressed: () {
                      songplayercontroller.setLoopSong();
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.volume_up),
                  iconSize: 30,
                  color: Colors.blue,
                  onPressed: () {
                    _showVolumeDialog(context, songplayercontroller);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.favorite),
                  iconSize: 30,
                  color: Colors.blue,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showVolumeDialog(
      BuildContext context, Songplayercontroller controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adjust Volume'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Slider(
                value: _volumeValue,
                min: 0,
                max: 100,
                divisions: 100,
                label: _volumeValue.toInt().toString(),
                onChanged: (value) {
                  setState(() {
                    _volumeValue = value;
                  });
                  controller.player.setVolume(_volumeValue / 100);
                },
                activeColor: Colors.blue,
                inactiveColor: Colors.blue.withOpacity(0.5),
              ),
              Text(
                '${_volumeValue.toInt()}%',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

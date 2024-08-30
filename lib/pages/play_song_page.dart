import 'package:flutter/material.dart';
import 'package:music_player/component/songAndVolume.dart';

class PlaySongPage extends StatelessWidget {
  const PlaySongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 10.0),
              SongAndVolume(),
            ],
          ),
        ),
      ),
    );
  }
}

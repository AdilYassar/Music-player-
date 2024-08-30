import 'package:flutter/material.dart';

class SongPageHeader extends StatelessWidget {
  const SongPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.music_note,
          size: 30.0,
          color: Colors.blue,
        ),
        SizedBox(width: 8),
        Text(
          "Music Player",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins",
          ),
        ),
      ],
    );
  }
}

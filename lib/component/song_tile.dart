import 'package:flutter/material.dart';

class SongTile extends StatelessWidget {
  final String songName;
  final VoidCallback onPress;
  const SongTile({super.key, required this.songName, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onPress,
        child: Container(
          child: Row(
            children: [
              Icon(
                Icons.play_arrow,
                size: 30.0,
                color: Colors.blue.withOpacity(0.5),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  songName,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

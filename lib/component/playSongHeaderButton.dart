import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:music_player/config/colors.dart';

class PlaySongHeaderButton extends StatelessWidget {
  const PlaySongHeaderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 48, 60, 34),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: SvgPicture.asset("assets/icons/backbutton.jpeg"),
          ),
        ),
        Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 48, 60, 34),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: SvgPicture.asset("assets/icons/th.jpeg"),
          ),
        )
      ],
    );
  }
}

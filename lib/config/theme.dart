import 'package:flutter/material.dart';
import 'package:music_player/config/colors.dart';

var darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      surface: bg_color,
      primary: primary_color,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: font_color,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: font_color,
      ),
      bodySmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      labelSmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: label_color,
      ),
      labelMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: label_color,
      ),
    ));

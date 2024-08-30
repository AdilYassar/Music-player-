import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:music_player/component/songAndVolume.dart';
import 'package:music_player/config/theme.dart';
import 'package:music_player/firebase_options.dart';

//import 'package:music_player/pages/play_song_page.dart';
import 'package:music_player/pages/song_page.dart';
//import 'package:music_player/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: const SongPage(),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:music_player/model/mySongModel.dart';

class CloudSongController extends GetxController {
  final db = FirebaseFirestore.instance;

  RxList<MySongModel> cloudSongList = RxList<MySongModel>([]);

  @override
  void onInit() {
    getCloudSongs();
    // TODO: implement onInit
    super.onInit();
  }

  void getCloudSongs() async {
    cloudSongList.clear();
    print("Fetching songs from Firestore...");

    try {
      QuerySnapshot snapshot = await db.collection("songs").get();

      for (var doc in snapshot.docs) {
        print("Song data: ${doc.data()}");

        try {
          var song = MySongModel.fromJson(doc.data() as Map<String, dynamic>);
          cloudSongList.add(song);
        } catch (e) {
          print("Error parsing song data: $e");
        }
      }

      print("Songs successfully fetched. Total songs: ${cloudSongList.length}");
    } catch (e) {
      print("Failed to fetch songs: $e");
    }
  }

/*
  void uploadSongToDatabase() async {
    try {
      MySongModel newSong = MySongModel(
        id: 1,
        title: "naino ki batien naina janey",
        artist: "adil",
        album: "my ak",
        data:
            "https://firebasestorage.googleapis.com/v0/b/music-bag-c9e21.appspot.com/o/(236)%20Naino%20ki%20jo%20bat%20naina%20Jane%20hai%20!New%20Romantic%20Love%20Story%20Hindu%20Muslim%202018%20-%20YouTube.mp3?alt=media&token=0195f799-b3e3-4dac-9b66-1af80724fe88",
      );

      await db.collection("songs").add(newSong.toJson());
      print("Song uploaded successfully");
    } catch (e) {
      print("Failed to upload song: $e");
    }
  }*/
}

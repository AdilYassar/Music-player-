import 'package:get/get.dart';
import 'package:music_player/controller/songPlayerController.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class SongDataController extends GetxController {
  final audioQuery = OnAudioQuery();
  Songplayercontroller songplayercontroller = Get.put(Songplayercontroller());

  RxList<SongModel> localSongList = <SongModel>[].obs;
  RxBool isDeviceSong = false.obs;
  RxInt currentSongPlayingIndex = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getLocalSongs();
    //storagePermission();
  }

  void getLocalSongs() async {
    localSongList.value = await audioQuery.querySongs(
      ignoreCase: true,
      orderType: OrderType.ASC_OR_SMALLER,
      sortType: null,
      uriType: UriType.EXTERNAL,
    );
  }

  void findCurrentPlayingSongId(int songId) {
    var index = 0;

    localSongList.forEach((e) {
      if (e.id == songId) {
        currentSongPlayingIndex.value = index;
      }
      index++;
    });
    print(songId);
    print(currentSongPlayingIndex);
  }

  void playNextSong() {
    currentSongPlayingIndex.value = currentSongPlayingIndex.value + 1;
    SongModel nextSong = localSongList[currentSongPlayingIndex.value];
    songplayercontroller.playLocalAudio(nextSong);
  }

  void playPreviousSong() {
    currentSongPlayingIndex.value = currentSongPlayingIndex.value - 1;
    SongModel nextSong = localSongList[currentSongPlayingIndex.value];
    songplayercontroller.playLocalAudio(nextSong);
  }

  void storagePermission() async {
    try {
      var status = await Permission.storage.status;
      if (status.isGranted) {
        print('Storage permission already granted');
        getLocalSongs();
      } else {
        var result = await Permission.storage.request();
        if (result.isGranted) {
          print('Storage permission granted');
          getLocalSongs();
        } else {
          print('Storage permission denied');
        }
      }
    } catch (e) {
      print('Error requesting storage permission: $e');
    }
  }
}

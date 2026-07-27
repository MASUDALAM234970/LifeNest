import 'package:get/get.dart';

import '../model/MusicModel.dart';
import 'MusicService.dart';
import 'package:audioplayers/audioplayers.dart';


/// Controller for the "Playing Now" screen: fetches a single track by id
/// and drives audio playback (play/pause, seek, shuffle, repeat, favorite).
class PlayingNowController extends GetxController {
  static PlayingNowController get instance {
    if (!Get.isRegistered<PlayingNowController>()) {
      Get.put(PlayingNowController());
    }
    return Get.find<PlayingNowController>();
  }

  final MusicService _musicService = MusicService();
  final AudioPlayer _audioPlayer = AudioPlayer();

  final Rx<MusicModel?> currentMusic = Rx<MusicModel?>(null);
  final RxBool isLoading = false.obs;
  final RxBool isPlaying = false.obs;
  final RxBool isShuffle = false.obs;
  final RxBool isRepeat = false.obs;
  final RxBool isFavorite = false.obs;
  final Rx<Duration> position = Duration.zero.obs;
  final Rx<Duration> duration = Duration.zero.obs;

  @override
  void onInit() {
    super.onInit();
    _audioPlayer.onPositionChanged.listen((p) => position.value = p);
    _audioPlayer.onDurationChanged.listen((d) => duration.value = d);
    _audioPlayer.onPlayerComplete.listen((_) {
      isPlaying.value = false;
      if (isRepeat.value) {
        seek(Duration.zero);
        togglePlayPause();
      }
    });
  }

  /// Fetches /api/music/{id}/ and starts playback.


  Future<void> togglePlayPause() async {
    if (currentMusic.value == null) return;

    if (isPlaying.value) {
      await _audioPlayer.pause();
      isPlaying.value = false;
    } else {
      await _audioPlayer.play(
        UrlSource(currentMusic.value!.musicFile),
      );
      isPlaying.value = true;
    }
  }

  Future<void> seek(Duration pos) async {
    if (duration.value == Duration.zero) return;

    try {
      await _audioPlayer.seek(pos);
    } catch (e) {
      print("Seek Error: $e");
    }
  }

  Future<void> loadAndPlay(int id) async {
    try {
      isLoading.value = true;

      final music = await _musicService.fetchMusicById(id);
      currentMusic.value = music;

      print("Playing: ${music.musicFile}");

      await _audioPlayer.stop();

      await _audioPlayer.play(
        UrlSource(music.musicFile),
      );

      print("Player State: ${_audioPlayer.state}");

      print("Player State: ${_audioPlayer.state}");

      isPlaying.value = true;
    } catch (e, s) {
      print("PLAY ERROR: $e");
      print(s);

      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }




  void toggleShuffle() => isShuffle.value = !isShuffle.value;
  void toggleRepeat() => isRepeat.value = !isRepeat.value;
  void toggleFavorite() => isFavorite.value = !isFavorite.value;

  String formatDuration(Duration d) {
    final m = d.inMinutes.remainder(60).toString();
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }
}
import 'package:get/get.dart';

import '../model/MusicModel.dart';
import 'MusicService.dart';

/// Controller for the "Music Therapy" grid screen
/// (All / Favorites / Sleep / Alone / Focus tabs).
class MusicListController extends GetxController {
  static MusicListController get instance {
    if (!Get.isRegistered<MusicListController>()) {
      Get.put(MusicListController());
    }
    return Get.find<MusicListController>();
  }

  final MusicService _musicService = MusicService();

  final RxList<MusicModel> musicList = <MusicModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxString selectedTab = 'All'.obs; // All, Favorites, Sleep, Alone, Focus
  final RxSet<int> favoriteIds = <int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMusicList();
  }

  Future<void> fetchMusicList() async {
    try {
      isLoading.value = true;
      final list = await _musicService.fetchMusicList();
      musicList.assignAll(list);
      print(
        'list length: ${musicList.length}, tab: ${selectedTab.value}, filtered: ${filteredList.length}',
      );
    } catch (e, stackTrace) {
      print("ERROR: $e");
      print(stackTrace);

      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  List<MusicModel> get filteredList {
    if (selectedTab.value == 'All') {
      return musicList.toList();
    }

    if (selectedTab.value == 'Favorites') {
      return musicList.where((m) => favoriteIds.contains(m.id)).toList();
    }

    return musicList
        .where(
          (m) =>
              m.category.trim().toLowerCase() ==
              selectedTab.value.trim().toLowerCase(),
        )
        .toList();
  }

  void changeTab(String tab) {
    selectedTab.value = tab;
  }

  void toggleFavorite(int id) {
    if (favoriteIds.contains(id)) {
      favoriteIds.remove(id);
    } else {
      favoriteIds.add(id);
    }
  }

  bool isFavorite(int id) => favoriteIds.contains(id);
}

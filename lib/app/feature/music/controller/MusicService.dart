import '../../../core/conts/endpoints.dart';
import '../../../core/networks/api_client.dart';
import '../model/MusicModel.dart';

class MusicService {
  /// GET /api/music/list/

  Future<List<MusicModel>> fetchMusicList() async {
    final List<dynamic> data = await ApiClient.instance.get(
      Endpoints.musicList,
    );

    return data
        .map((e) => MusicModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// GET /api/music/{id}/

  Future<MusicModel> fetchMusicById(int id) async {
    final Map<String, dynamic> data = await ApiClient.instance.get(
      "${Endpoints.musicById}/$id/",
    );

    return MusicModel.fromJson(data);
  }
}

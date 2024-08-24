import 'package:music_app/config/api/song_path.dart';
import 'package:music_app/data/models/model_song.dart';
import 'package:music_app/data/responsitory/responsitory.dart';
import 'package:music_app/data/source/api/rest_client.dart';

class SongService extends Responsitory {
  final RestClient _restClient = RestClient(baseUrl: api_song);
  @override
  Future<List<ModelSong>> getData() async {
    try {
      final tmp = await _restClient.getData('song.json');
      if (tmp is List<dynamic>) {
        List<ModelSong> songs =
            tmp.map((value) => ModelSong.fromJSON(value)).toList();
        return songs;
      }
      throw 'Lỗi nhận dữ liệu';
    } catch (e) {
      throw 'Lỗi get data';
    }
  }
}

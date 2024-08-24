import 'package:mobx/mobx.dart';
import 'package:music_app/data/models/model_song.dart';
import 'package:music_app/data/service/song_service.dart';
part 'data_song.g.dart';

class DataSong = _DataSong with _$DataSong;

abstract class _DataSong with Store {
  @observable
  ObservableList<ModelSong> songs = ObservableList<ModelSong>();

  @observable
  int currentIndex = 0;

  @observable
  bool isLoading = true;

  @action
  void setCurrentIndex(int value) {
    currentIndex = value;
  }

  @action
  void setPrevSong() {
    --currentIndex;
  }

  @action
  void setNextSong() {
    ++currentIndex;
  }

  @action
  getData() async {
    List<ModelSong> songTmp;
    try {
      songTmp = await SongService().getData();
      songs.addAll(songTmp);
      // await _saveUser(songs);
      isLoading = false;
    } catch (e) {
      // songs.addAll(await _loadUserList());
      isLoading = false;
    }
  }

  // lưu vào bộ nhớ
  // @action
  // Future<void> _saveUser(List<ModelSong> songs) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String songJson = jsonEncode(songs.map((e) => e.toJSON()).toList());
  //   await prefs.setString('songList', songJson);
  // }

  // đọc dữ liệu từ bộ nhớ
//   @action
//   Future<List<ModelSong>> _loadUserList() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     // Đọc chuỗi JSON từ SharedPreferences
//     String? songListJson = prefs.getString('songList');
//     if (songListJson != null) {
//       // chuyển JSON thành Map
//       List<dynamic> userListDynamic = jsonDecode(songListJson);
//       List<ModelSong> songList =
//           userListDynamic.map((e) => ModelSong.fromJSON(e)).toList();
//       return songList;
//     } else {
//       return [];
//     }
//   }
}

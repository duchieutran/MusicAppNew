import 'package:music_app/data/models/model_song.dart';

abstract class Responsitory {
  // get
  Future<List<ModelSong>> getData();
}

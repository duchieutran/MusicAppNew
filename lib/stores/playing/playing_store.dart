import 'package:just_audio/just_audio.dart';
import 'package:mobx/mobx.dart';
part 'playing_store.g.dart';

enum RepeatMode { off, one, all }

class PlayingStore = _PlayingStore with _$PlayingStore;

abstract class _PlayingStore with Store {
  final AudioPlayer player = AudioPlayer();

  @observable
  bool isPlaying = false;

  @observable
  bool isLoading = false;

  @observable
  RepeatMode repeatMode = RepeatMode.off;

  @action
  void toggleRepeatMode() {
    switch (repeatMode) {
      case RepeatMode.off:
        repeatMode = RepeatMode.one;
        break;
      case RepeatMode.one:
        repeatMode = RepeatMode.all;
        break;
      case RepeatMode.all:
        repeatMode = RepeatMode.off;
        break;
    }
  }

  @action
  setisPlaying(bool value) {
    isPlaying = value;
  }

  @action
  void dispose() {
    player.dispose();
  }

  @action
  Future<void> playMusicFromUrl(String url) async {
    isLoading = true;
    try {
      await player.setUrl(url);
      setisPlaying(true);
      player.playerStateStream.listen((state) {
        if (state.playing) {
          setisPlaying(true);
        } else {
          setisPlaying(false);
        }
      });
      isLoading = false;
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }

  @action
  void updateSong(String url) {
    player.stop();
    playMusicFromUrl(url);
    player.play();
  }

  @action
  Future<void> pauseMusic() async {
    await player.pause();
    setisPlaying(player.playing);
  }

  @action
  Future<void> resumeMusic() async {
    await player.play();
    setisPlaying(player.playing);
  }
}

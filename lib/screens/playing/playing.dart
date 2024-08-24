import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/data/models/model_song.dart';
import 'package:music_app/screens/playing/widget/playing_playmusic.dart';
import 'package:music_app/stores/datasong/data_song.dart';
import 'package:music_app/stores/playing/playing_store.dart';

class Playing extends StatefulWidget {
  final DataSong store;
  const Playing({super.key, required this.store});

  @override
  State<Playing> createState() => _PlayingState();
}

class _PlayingState extends State<Playing> {
  final PlayingStore _playingStore = PlayingStore();
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  bool _isDragging = false;
  late ModelSong _currentSong;

  @override
  void initState() {
    _currentSong = widget.store.songs[widget.store.currentIndex];
    _playingStore.playMusicFromUrl(_currentSong.source);
    _playingStore.player.positionStream.listen((position) {
      if (!_isDragging) {
        setState(() {
          _position = position;
        });
      }
    });
    _playingStore.player.durationStream.listen((duration) {
      setState(() {
        _duration = duration ?? Duration.zero;
      });
    });

    _playingStore.player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        _handleSongCompletion();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _playingStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playing'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (context) => Text(
                widget.store.songs[widget.store.currentIndex].album,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp,
                ),
              ),
            ),
            Text(
              '_ __ _',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: 0.8.sw,
              child: Observer(
                builder: (context) => ClipRRect(
                  borderRadius: BorderRadius.circular(1.sw - 0.1.sw) / 2,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/music.png',
                    image: widget.store.songs[widget.store.currentIndex].image,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0.05.sh,
            ),
            Observer(
              builder: (context) => Text(
                widget.store.songs[widget.store.currentIndex].title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp,
                ),
              ),
            ),
            Observer(
              builder: (context) => Text(
                widget.store.songs[widget.store.currentIndex].artist,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(
              height: 0.1.sh,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
              child: ProgressBar(
                progress: _position,
                total: _duration,
                onSeek: (duration) {
                  _playingStore.player.seek(duration);
                },
                barHeight: 2,
                baseBarColor: Colors.grey,
                progressBarColor: Colors.blue,
                thumbColor: Colors.blueAccent,
                thumbRadius: 5.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    //TODO :
                  },
                  icon: const Icon(
                    Icons.shuffle,
                    size: 30,
                  ),
                ),
                // next prev
                IconButton(
                  onPressed: setPrevSong,
                  icon: const Icon(
                    Icons.skip_previous,
                    size: 30,
                  ),
                ),
                // button controller
                PlayMusic(playingStore: _playingStore),
                // next skip
                IconButton(
                  onPressed: setNextSong,
                  icon: const Icon(
                    Icons.skip_next,
                    size: 30,
                  ),
                ),
                Observer(
                  builder: (context) {
                    IconData icon;
                    switch (_playingStore.repeatMode) {
                      case RepeatMode.off:
                        icon = Icons.repeat;
                        break;
                      case RepeatMode.one:
                        icon = Icons.repeat_one;
                        break;
                      case RepeatMode.all:
                        icon = Icons.repeat;
                        break;
                    }
                    return IconButton(
                      onPressed: _playingStore.toggleRepeatMode,
                      icon: Icon(
                        icon,
                        size: 30,
                        color: _playingStore.repeatMode != RepeatMode.off
                            ? Colors.blue
                            : Colors.black,
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // TODO : xử lý nếu next đến cuối, và lùi về 0
  void setPrevSong() {
    widget.store.setPrevSong();
    _playingStore
        .updateSong(widget.store.songs[widget.store.currentIndex].source);
  }

  void setNextSong() {
    widget.store.setNextSong();
    _playingStore
        .updateSong(widget.store.songs[widget.store.currentIndex].source);
  }

  void _handleSongCompletion() {
    if (_playingStore.repeatMode == RepeatMode.one) {
      _playingStore.player.seek(Duration.zero);
      _playingStore.player.play();
    } else if (_playingStore.repeatMode == RepeatMode.all) {
      setNextSong();
    }
  }
}

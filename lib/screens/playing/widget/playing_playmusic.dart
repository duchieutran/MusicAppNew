import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_app/stores/playing/playing_store.dart';

class PlayMusic extends StatelessWidget {
  const PlayMusic({
    super.key,
    required PlayingStore playingStore,
  }) : _playingStore = playingStore;

  final PlayingStore _playingStore;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => _playingStore.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Observer(
              builder: (context) {
                if (_playingStore.isLoading) {
                  return const CircularProgressIndicator();
                } else {
                  return IconButton(
                    icon: Icon(
                      _playingStore.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                    iconSize: 48.sp,
                    onPressed: () {
                      if (_playingStore.isPlaying) {
                        _playingStore.pauseMusic();
                      } else {
                        _playingStore.resumeMusic();
                      }
                    },
                  );
                }
              },
            ),
    );
  }
}
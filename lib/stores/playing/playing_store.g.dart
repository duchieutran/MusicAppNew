// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playing_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlayingStore on _PlayingStore, Store {
  late final _$isPlayingAtom =
      Atom(name: '_PlayingStore.isPlaying', context: context);

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PlayingStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$repeatModeAtom =
      Atom(name: '_PlayingStore.repeatMode', context: context);

  @override
  RepeatMode get repeatMode {
    _$repeatModeAtom.reportRead();
    return super.repeatMode;
  }

  @override
  set repeatMode(RepeatMode value) {
    _$repeatModeAtom.reportWrite(value, super.repeatMode, () {
      super.repeatMode = value;
    });
  }

  late final _$playMusicFromUrlAsyncAction =
      AsyncAction('_PlayingStore.playMusicFromUrl', context: context);

  @override
  Future<void> playMusicFromUrl(String url) {
    return _$playMusicFromUrlAsyncAction.run(() => super.playMusicFromUrl(url));
  }

  late final _$pauseMusicAsyncAction =
      AsyncAction('_PlayingStore.pauseMusic', context: context);

  @override
  Future<void> pauseMusic() {
    return _$pauseMusicAsyncAction.run(() => super.pauseMusic());
  }

  late final _$resumeMusicAsyncAction =
      AsyncAction('_PlayingStore.resumeMusic', context: context);

  @override
  Future<void> resumeMusic() {
    return _$resumeMusicAsyncAction.run(() => super.resumeMusic());
  }

  late final _$_PlayingStoreActionController =
      ActionController(name: '_PlayingStore', context: context);

  @override
  void toggleRepeatMode() {
    final _$actionInfo = _$_PlayingStoreActionController.startAction(
        name: '_PlayingStore.toggleRepeatMode');
    try {
      return super.toggleRepeatMode();
    } finally {
      _$_PlayingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setisPlaying(bool value) {
    final _$actionInfo = _$_PlayingStoreActionController.startAction(
        name: '_PlayingStore.setisPlaying');
    try {
      return super.setisPlaying(value);
    } finally {
      _$_PlayingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_PlayingStoreActionController.startAction(
        name: '_PlayingStore.dispose');
    try {
      return super.dispose();
    } finally {
      _$_PlayingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSong(String url) {
    final _$actionInfo = _$_PlayingStoreActionController.startAction(
        name: '_PlayingStore.updateSong');
    try {
      return super.updateSong(url);
    } finally {
      _$_PlayingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPlaying: ${isPlaying},
isLoading: ${isLoading},
repeatMode: ${repeatMode}
    ''';
  }
}

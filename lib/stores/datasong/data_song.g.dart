// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_song.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DataSong on _DataSong, Store {
  late final _$songsAtom = Atom(name: '_DataSong.songs', context: context);

  @override
  ObservableList<ModelSong> get songs {
    _$songsAtom.reportRead();
    return super.songs;
  }

  @override
  set songs(ObservableList<ModelSong> value) {
    _$songsAtom.reportWrite(value, super.songs, () {
      super.songs = value;
    });
  }

  late final _$currentIndexAtom =
      Atom(name: '_DataSong.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_DataSong.isLoading', context: context);

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

  late final _$getDataAsyncAction =
      AsyncAction('_DataSong.getData', context: context);

  @override
  Future getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_DataSongActionController =
      ActionController(name: '_DataSong', context: context);

  @override
  void setCurrentIndex(int value) {
    final _$actionInfo = _$_DataSongActionController.startAction(
        name: '_DataSong.setCurrentIndex');
    try {
      return super.setCurrentIndex(value);
    } finally {
      _$_DataSongActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrevSong() {
    final _$actionInfo =
        _$_DataSongActionController.startAction(name: '_DataSong.setPrevSong');
    try {
      return super.setPrevSong();
    } finally {
      _$_DataSongActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNextSong() {
    final _$actionInfo =
        _$_DataSongActionController.startAction(name: '_DataSong.setNextSong');
    try {
      return super.setNextSong();
    } finally {
      _$_DataSongActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
songs: ${songs},
currentIndex: ${currentIndex},
isLoading: ${isLoading}
    ''';
  }
}

class ModelSong {
  final String id, title, album, artist, source, image;
  final int duration;

  ModelSong(
      {required this.id,
      required this.title,
      required this.album,
      required this.artist,
      required this.source,
      required this.image,
      required this.duration});

  ModelSong.fromJSON(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        album = map['album'],
        artist = map['artist'],
        source = map['source'],
        image = map['image'],
        duration = map['duration'];

  Map<String, dynamic> toJSON() => {
        'id': id,
        'title': title,
        'album': album,
        'artist': artist,
        'source': source,
        'image': image,
        'duration': duration
      };

  @override
  String toString() {
    return 'Song(id: $id, title: $title, album: $album, artist: $artist, source: $source, image: $image, duration: $duration)';
  }
}

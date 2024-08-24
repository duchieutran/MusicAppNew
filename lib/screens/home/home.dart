import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:music_app/config/routes/app_route.dart';
import 'package:music_app/data/models/model_song.dart';
import 'package:music_app/stores/datasong/data_song.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _store = DataSong();
  @override
  void initState() {
    _store.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Nhạc'),
        centerTitle: true,
        leading: const Icon(
          Icons.star,
          color: Colors.blue,
        ),
        actions: null,
      ),
      body: Observer(
        builder: (context) {
          return ListView.builder(
            itemCount: _store.songs.length,
            itemBuilder: (context, index) {
              final ModelSong song = _store.songs[index];
              return Observer(
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(5),
                  child: ListTile(
                    onTap: () {
                      _store.setCurrentIndex(index);
                      Navigator.pushNamed(context, AppRoute.playing,
                          arguments: _store);
                    },
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/music.png',
                          image: song.image),
                    ),
                    title: Text(song.title),
                    subtitle: Text(song.artist),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

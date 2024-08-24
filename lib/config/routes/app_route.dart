import 'package:flutter/material.dart';
import 'package:music_app/screens/main_app.dart';
import 'package:music_app/screens/playing/playing.dart';
import 'package:music_app/screens/splash/splash.dart';
import 'package:music_app/stores/datasong/data_song.dart';

class AppRoute {
  static MaterialPageRoute<dynamic> onGenerateRoute(RouteSettings settings) =>
      MaterialPageRoute(
        builder: (context) => makeRoute(
            context: context,
            nameRoute: settings.name!,
            arguments: settings.arguments),
      );

  static makeRoute(
      {required String nameRoute,
      required BuildContext context,
      Object? arguments}) {
    switch (nameRoute) {
      case splash:
        return const Splash();
      case mainapp:
        return const MainAppScreen();
      case playing:
        return Playing(
          store: arguments as DataSong,
        );

      default:
        throw '$nameRoute is not define !';
    }
  }

  static const String splash = '/';
  static const String mainapp = 'mainscreen';
  static const String playing = 'playing';
}

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:music_app/screens/discover/discover.dart';
import 'package:music_app/screens/home/home.dart';
import 'package:music_app/screens/profile/profile.dart';
import 'package:music_app/screens/settings/setting.dart';
import 'package:music_app/stores/bottomNavigator/bottom_navigator.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  final BottomNavigator _bottomNavigator = BottomNavigator();

  final List<Widget> screens = const [
    Home(),
    Discover(),
    Profile(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Observer(
        builder: (context) => CurvedNavigationBar(
          color: Colors.grey.shade200,
          buttonBackgroundColor: Colors.blue[200],
          maxWidth: MediaQuery.of(context).size.width,
          items: const [
            Icon(
              Icons.home,
              size: 30,
            ),
            Icon(
              Icons.album,
              size: 30,
            ),
            Icon(
              Icons.person,
              size: 30,
            ),
            Icon(
              Icons.settings,
              size: 30,
            ),
          ],
          index: _bottomNavigator.index,
          onTap: (value) {
            _bottomNavigator.setIndex(value);
          },
          height: 70,
          backgroundColor: Colors.transparent,
          animationDuration: const Duration(milliseconds: 300),
        ),
      ),
      body: Observer(
        builder: (context) => screens[_bottomNavigator.index],
      ),
    );
  }
}

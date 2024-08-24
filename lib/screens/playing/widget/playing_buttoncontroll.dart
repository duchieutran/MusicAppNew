import 'package:flutter/material.dart';

class PlayingButtoncontroll extends StatelessWidget {
  const PlayingButtoncontroll(
      {super.key,
      this.function,
      required this.icon,
      this.color = Colors.black,
      this.sizeIcon = 34});
  final void Function()? function;
  final IconData icon;
  final Color color;
  final double sizeIcon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: function,
        icon: Icon(
          Icons.abc,
          color: color,
          size: sizeIcon,
        ));
  }
}

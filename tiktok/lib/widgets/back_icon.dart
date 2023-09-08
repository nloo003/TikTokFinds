import 'package:flutter/material.dart';

class BackIcon extends StatefulWidget {
  const BackIcon({super.key});

  @override
  State<BackIcon> createState() => _BackIconState();
}

class _BackIconState extends State<BackIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.arrow_back_ios_new_outlined),
      style: const ButtonStyle(
          iconColor: MaterialStatePropertyAll(Colors.white70)),
    );
  }
}

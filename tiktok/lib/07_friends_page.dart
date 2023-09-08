// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tiktok/widgets/back_icon.dart';

class FriendPageFactory extends StatefulWidget {
  const FriendPageFactory({super.key});

  @override
  State<FriendPageFactory> createState() => _FriendPageFactoryState();
}

class _FriendPageFactoryState extends State<FriendPageFactory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackIcon(),
      ),
    );
  }
}

class SinglePersonTile extends StatelessWidget {
  const SinglePersonTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const FractionallySizedBox(
      child: Text("XXX TILE"),
    );
  }
}

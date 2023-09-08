// ignore_for_file: file_names
import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const Icon(Icons.arrow_back_ios_new_outlined),
        backgroundColor: Colors.black,
        actions: [
          GestureDetector(
            onTap: (() {
              debugPrint("Discover_more button clicked");
            }),
            child: const Icon(Icons.more_horiz_outlined),
          )
        ],
      ),
      body: const Center(
        child: Text('discover'),
      ),
    );
  }
}

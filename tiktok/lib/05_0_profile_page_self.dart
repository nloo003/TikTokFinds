import 'package:flutter/material.dart';

class ProfilePageSelf extends StatefulWidget {
  const ProfilePageSelf({super.key});

  @override
  State<ProfilePageSelf> createState() => _ProfilePageSelfState();
}

class _ProfilePageSelfState extends State<ProfilePageSelf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: GestureDetector(
            onTap: () {
              debugPrint("Username clicked");
            },
            child: const Text(
              "Username",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        leading: null,
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.history_outlined,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.menu_outlined,
              ),
            ),
          )
        ],
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Text('profile_self'),
      ),
    );
  }
}

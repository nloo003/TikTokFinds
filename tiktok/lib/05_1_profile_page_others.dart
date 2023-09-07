// ignore_for_file: file_names
import 'package:flutter/material.dart';

class ProfilePageOthers extends StatefulWidget {
  const ProfilePageOthers({super.key});

  @override
  State<ProfilePageOthers> createState() => _ProfilePageOthersState();
}

class _ProfilePageOthersState extends State<ProfilePageOthers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const Icon(Icons.arrow_back_ios),
        centerTitle: true,
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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.notifications_outlined,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.link_outlined,
              ),
            ),
          )
        ],
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Text('profile_public'),
      ),
    );
  }
}

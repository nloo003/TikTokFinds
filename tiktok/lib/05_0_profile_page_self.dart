import 'package:flutter/material.dart';

class ProfilePageSelf extends StatefulWidget {
  const ProfilePageSelf({super.key});

  @override
  State<ProfilePageSelf> createState() => _ProfilePageSelfState();
}

class _ProfilePageSelfState extends State<ProfilePageSelf> {
  String username = "username";
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
            child: Text(
              username,
              style: const TextStyle(color: Colors.white),
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
      body: Stack(
        children: [
          Column(
            children: [
              const Image(
                image: AssetImage("tiktok\assets\test_chicken.png"),
              ),
              Row(children: [
                Text(username),
                const Icon(Icons.qr_code),
              ]),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Column(
                      children: [Text("123"), Text("Following")],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Column(
                      children: [Text("456"), Text("Followers")],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Column(
                      children: [Text("789"), Text("Likes")],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

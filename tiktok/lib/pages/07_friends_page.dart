// ignore_for_file: file_names, unused_import, prefer_interpolation_to_compose_strings

import 'package:http/http.dart' as http;
import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tiktok/pages/05_1_profile_page_others.dart';
import 'package:tiktok/model/user_model.dart';
import 'package:tiktok/widgets/back_icon.dart';

class User {
  final String username;
  final String handle;

  const User({required this.username, required this.handle});
}

class FriendPageState extends StatefulWidget {
  // const FriendPageFactory({super.key});
  final String? userId;

  const FriendPageState({
    Key? key,
    required this.userId
  }) : super(key: key);

  @override
  State<FriendPageState> createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPageState> {
  List<UserModel> userList = [
    UserModel(
        '64fbf60e3c612b13b658d6ed',
        'Jin Kai',
        '@howboutyou',
        [],
        [],
        '927',
        "https://images.unsplash.com/photo-1508341591423-4347099e1f19?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3087&q=80"),
    UserModel('64fbf55b3c612b13b658d6e9', 'Tharun', '@GGMU', [], [], '700',
        "https://images.unsplash.com/photo-1557778358-9fb87328a7db?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2055&q=80"),
  ];

  // Future<UserModel> fetchData(String userId) async {
  //   try {
  //     UserModel tempUser;
  //     tempUser = await getUser(userId);
  //     debugPrint(tempUser.name);
  //     return tempUser;
  //   } catch (e) {
  //     debugPrint("fetch data failed: $userId");
  //     throw Error();
  //   }
  // }

  // String userId = '64fbf5b43c612b13b658d6eb';
  UserModel user = UserModel("", "", "", [], [], '0', "");
  @override
  void initState() {
    super.initState();
    // Call the fetchData function when the widget is initialized
    // getUser(userId).then((item) {
    //   setState(() {
    //     user = item;
    //     for (int i = 0; i < widget.userIdList.length; i++) {
    //       userList.add(fetchData(widget.userIdList[i]));
    //     }
    //   });
    // });

    // for (int i = 0; i < widget.userIdList.length; i++) {
    //   debugPrint("For loop start");
    //   setState(() {
    //     getUser(widget.userIdList[i]).then((value) {
    //       userList.add(value);
    //     });
    //   });

    //   // getUser(widget.userIdList[i]).then((item) {
    //   //   debugPrint("GetUser");
    //   //   setState(() async {
    //   //     userList!.add(item);
    //   //   });
    //   // });
    // }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.userId);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackIcon(),
        backgroundColor: Colors.black,
        title: Text(user.name!),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.add_reaction_outlined),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: Text(
                        "Following " + userList.length.toString(),
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: Text(
                        "Followers " + userList.length.toString(),
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: Text(
                        "Friends " + userList.length.toString(),
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SearchBar(
                onSubmitted: (value) {},
                hintText: "Search Users",
                backgroundColor: MaterialStateProperty.all(Colors.white70),
                padding: const MaterialStatePropertyAll(
                    EdgeInsets.fromLTRB(5, 5, 5, 5)),
                leading: const Icon(
                  Icons.search_outlined,
                  color: Colors.black,
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(userList[0].name!),
                subtitle: Text(userList[0].handle!),
                trailing: const Icon(Icons.notifications_outlined),
                leading: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return ProfilePageOthers(
                          userId: userList[0].id,
                        );
                      }),
                    );
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        NetworkImage(userList[0].profilePicUrl.toString()),
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(userList[1].name!),
                subtitle: Text(userList[1].handle!),
                trailing: const Icon(Icons.notifications_outlined),
                leading: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return ProfilePageOthers(
                          userId: userList[1].id,
                        );
                      }),
                    );
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        NetworkImage(userList[1].profilePicUrl.toString()),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: file_names, unused_import

import 'package:http/http.dart' as http;
import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tiktok/05_1_profile_page_others.dart';
import 'package:tiktok/model/user_model.dart';
import 'package:tiktok/widgets/back_icon.dart';
import 'package:tiktok/model/api.dart';

class FriendPage extends StatefulWidget {
  final List<String> userIdList;
  const FriendPage({required this.userIdList, super.key});

  @override
  State<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  List<UserModel> userList = [];

  String userId = '64fbf5b43c612b13b658d6eb';
  UserModel user = const UserModel("", "", "", [], [], 0, "");

  @override
  void initState() {
    super.initState();
    // Call the fetchData function when the widget is initialized
    getUser(userId).then((item) {
      setState(() {
        user = item;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackIcon(),
        backgroundColor: Colors.black,
        title: Text(user.name),
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
                      child: const Text(
                        "Following 58",
                        style: TextStyle(color: Colors.white70, fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: const Text(
                        "Follwers 30",
                        style: TextStyle(color: Colors.white70, fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: const Text(
                        "Friends 50",
                        style: TextStyle(color: Colors.white70, fontSize: 15),
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
            Expanded(
              child: ListView.builder(
                  itemCount: widget.userIdList.length,
                  itemBuilder: (context, index) {
                    debugPrint(widget.userIdList.toString());
                    debugPrint(widget.userIdList.length.toString());

                    for (int i = 0; i < widget.userIdList.length; i++) {
                      debugPrint("For loop start");
                      setState(() async {
                        getUser(widget.userIdList[i]).then((value) {
                          userList!.add(value);
                        });
                      });

                      // getUser(widget.userIdList[i]).then((item) {
                      //   debugPrint("GetUser");
                      //   setState(() async {
                      //     userList!.add(item);
                      //   });
                      // });
                    }

                    debugPrint(userList![0].name);
                    debugPrint("done");
                    UserModel newPerson = userList![index];
                    return Card(
                      child: ListTile(
                        title: Text(newPerson.name),
                        subtitle: Text(newPerson.handle),
                        trailing: const Icon(Icons.notifications_outlined),
                        leading: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return const ProfilePageOthers();
                                }),
                              );
                            },
                            child: const Icon(Icons.plus_one_outlined)),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: file_names, unused_import

import 'package:http/http.dart' as http;
import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tiktok/05_1_profile_page_others.dart';
import 'package:tiktok/model/user_model.dart';
import 'package:tiktok/widgets/back_icon.dart';

class User {
  final String username;
  final String handle;

  const User({required this.username, required this.handle});
}

class FriendPageFactory extends StatefulWidget {
  const FriendPageFactory({super.key});

  @override
  State<FriendPageFactory> createState() => _FriendPageFactoryState();
}

class _FriendPageFactoryState extends State<FriendPageFactory> {
  String initialUserId = "64faace4f139f050c81cdab1";
  UserModel user = UserModel("", "", "", [], [], 0, "");

  List<UserModel> userList = [];

  // Future<UserModel> getUsers(String id) async {
  //   try {
  //     var url = Uri.parse("http://10.0.2.2::4000/api/user/profile/:$id");
  //     final response = await http.get(url);

  //     if (response.statusCode == 200){
  //       final List<dynamic> responseData = jsonDecode(response.body);

  //       final <UserModel> data = responseData.map(((json) =>  UserModel.fromJson(json))).toList();

  //       return data;
  //     }
  //     else {
  //       debugPrint('Request failed with status: ${response.statusCode}');
  //       return [];
  //     }
  //   } catch (e) {
  //     debugPrint('Error: $e');
  //     return []; // Return an empty list in case of an exception
  //   }
  //   }
  //   void initState() {
  //     super.initState();
  //     getUsers(initialUserId).then((items) {
  //       setState(() {
  //         testUser = List.from(items);
  //       });
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
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
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    final user = userList[index];
                    return Card(
                      child: ListTile(
                        title: Text(user.name!),
                        subtitle: Text(user.handle!),
                        trailing: const Icon(Icons.notifications_outlined),
                        leading: GestureDetector(onTap: () {
                          Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
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

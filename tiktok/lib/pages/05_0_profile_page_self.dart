// ignore_for_file: file_names, unused_import
import 'package:flutter/material.dart';
import 'package:tiktok/pages/01_home_page.dart';
import 'package:tiktok/pages/06_1_wishlists_page.dart';
import 'package:tiktok/pages/07_friends_page.dart';
import 'package:tiktok/model/api.dart';
import 'package:tiktok/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'dart:convert';

import 'package:tiktok/pages/08_item_page.dart';

class ProfilePageSelf extends StatefulWidget {
  const ProfilePageSelf({super.key});

  @override
  State<ProfilePageSelf> createState() => _ProfilePageSelfState();
}

class _ProfilePageSelfState extends State<ProfilePageSelf> {
  String userId = '64fbf5b43c612b13b658d6eb';
  UserModel user = UserModel("", "", "", [], [], '0', "");

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
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: GestureDetector(
            onTap: () {
              debugPrint("Username clicked");
            },
            child: Text(
              user.name!,
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
      body: FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 1,
        child: Container(
          color: Colors.black,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.profilePicUrl!),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user.handle!,
                  style: const TextStyle(color: Colors.white),
                ),
                const Icon(
                  Icons.qr_code,
                  color: Colors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 15, 20, 5),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return FriendPageState(userId: user.id!); 
                        }),
                      );
                    },
                    child: Column(
                      children: [
                        Text(user.following!.length.toString(),
                            style: const TextStyle(color: Colors.white)),
                        const Text("Following",
                            style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return FriendPageState(userId: user.id!);
                        }),
                      );
                    },
                    child: Column(
                      children: [
                        Text(user.followers!.length.toString(),
                            style: const TextStyle(color: Colors.white)),
                        const Text("Followers",
                            style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 5, 5),
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Text(user.likes.toString(),
                            style: const TextStyle(color: Colors.white)),
                        const Text("Likes",
                            style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey)),
                    child: const Text("Edit Profile"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey)),
                    child: const Text("Add Friends"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return WishlistsPage(
                              userId: user.id,
                              indivList: false,
                              wishlistId: "",
                            );
                          }),
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blueGrey)),
                      child: const Text("Finds")),
                ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                //   child: ElevatedButton(
                //       onPressed: () {
                //         Navigator.of(context).push(
                //           MaterialPageRoute(builder: (BuildContext context) {
                //             return ItemPage(
                //                 itemId: "1",
                //                 itemName: "Item 1",
                //                 itemPrice: 19.99,
                //                 itemImage:
                //                     "https://images.unsplash.com/photo-1621265010303-a793d1017307?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
                //                 itemStore: "ABC",
                //             );
                //           }),
                //         );
                //       },
                //       style: ButtonStyle(
                //           backgroundColor:
                //               MaterialStateProperty.all(Colors.blueGrey)),
                //       child: const Text("Item")),
                // )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(20, 20))),
                child: const Text("+ Add Bio",
                    style: TextStyle(
                        fontSize: 12, overflow: TextOverflow.visible)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: OutlinedButton(
                    style: const ButtonStyle(alignment: Alignment.center),
                    onPressed: () {},
                    child: const Row(children: [
                      Icon(Icons.photo),
                      Text("Add Yours", style: TextStyle(fontSize: 12)),
                    ]),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                    onPressed: () {},
                    child: const Icon(Icons.browse_gallery_outlined)),
                OutlinedButton(
                    onPressed: () {}, child: const Icon(Icons.lock_outline)),
                OutlinedButton(
                    onPressed: () {},
                    child: const Icon(Icons.collections_outlined)),
                OutlinedButton(
                    onPressed: () {},
                    child: const Icon(Icons.favorite_outline)),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.picture_in_picture_alt_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        child: Text(
                            "Share a fun video you've recorded recently",
                            style: TextStyle(color: Colors.white)),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Upload",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

// ignore_for_file: file_names, unused_import
import 'package:flutter/material.dart';
import 'package:tiktok/06_1_wishlists_page.dart';
import 'package:tiktok/06_wishlist_page.dart';
import 'package:tiktok/07_friends_page.dart';
import 'package:tiktok/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'dart:convert';

class ProfilePageSelf extends StatefulWidget {
  const ProfilePageSelf({super.key});

  @override
  State<ProfilePageSelf> createState() => _ProfilePageSelfState();
}

class _ProfilePageSelfState extends State<ProfilePageSelf> {
  String initialUserId = "64fb433933c7ef2ac0c25804";
  UserModel user = const UserModel(
      "Meng Kiat",
      "mkiats",
      ["following"],
      ["followers"],
      1233,
      "_id",
      "ProfilePicURL",
      "created_at",
      "UpdatedAt",
      123321);

  Future<UserModel> getUser(String userId) async {
    try {
      var url = Uri.parse('http://10.0.2.2:4000/api/user/profile/${userId}');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        final UserModel user = UserModel.fromJson(responseData);

        return user;
      } else {
        // debugPrint('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to load user');
      }
    } catch (e) {
      // debugPrint('Error: $e');
      throw Exception('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getUser(initialUserId).then((item) {
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
              user.name,
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1529973625058-a665431328fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user.handle,
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
                          return const FriendPageFactory(user.following);
                        }),
                      );
                    },
                    child: Column(
                      children: [
                        Text(user.following.length.toString(),
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
                          return const FriendPageFactory(user.followers);
                        }),
                      );
                    },
                    child: Column(
                      children: [
                        Text(user.followers.length.toString(),
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
                            return const WishlistsPage(
                              // Pass userId as argument NICKY
                              userId: "",
                              indivList: false,
                              wishlistId: "",
                            );
                          }),
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blueGrey)),
                      child: const Text("Wishlist")),
                )
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

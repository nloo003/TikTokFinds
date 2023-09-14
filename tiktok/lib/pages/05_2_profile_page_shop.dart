// ignore_for_file: file_names, unused_import
import 'package:flutter/material.dart';
import 'package:tiktok/pages/01_home_page.dart';
import 'package:tiktok/pages/06_1_wishlists_page.dart';
import 'package:tiktok/pages/06_wishlist_page.dart';
import 'package:tiktok/pages/07_friends_page.dart';
import 'package:tiktok/model/api.dart';
import 'package:tiktok/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'dart:convert';

import 'package:tiktok/pages/08_item_page.dart';

class ProfilePageShop extends StatefulWidget {
  const ProfilePageShop({super.key});
  // final String? shopName;

  // const ProfilePageShop({
  //   Key? key,
  //   required this.shopName
  // }) : super(key: key);


  @override
  State<ProfilePageShop> createState() => _ProfilePageSelfState();
}

class ListItem {
  final String itemName;
  final String image;

  ListItem(this.itemName, this.image);
}

class _ProfilePageSelfState extends State<ProfilePageShop> {
  String userId = '64fbf5b43c612b13b658d6eb';
  UserModel user = UserModel("", "", "", [], [], '0', "");
  List<ListItem> itemList = [
    ListItem("shampoo", "shampoo.com"),
    ListItem("soap", "soap.com"),
    ListItem("shampoo", "shampoo.com"),
    ListItem("soap", "soap.com"),
    ListItem("shampoo", "shampoo.com"),
    ListItem("soap", "soap.com"),
    ListItem("shampoo", "shampoo.com"),
    ListItem("soap", "soap.com"),
  ];

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
      backgroundColor: Colors.black,
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
      body: SingleChildScrollView(
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
                        return FriendPageState(userId: user.id!); //TODO
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
                      const Text("Likes", style: TextStyle(color: Colors.white))
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return ItemPage(
                              itemId: "1",
                              itemName: "Item 1",
                              itemPrice: 19.99,
                              itemImage:
                                  "https://images.unsplash.com/photo-1621265010303-a793d1017307?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80");
                        }),
                      );
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey)),
                    child: const Text("Item")),
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
                  style:
                      TextStyle(fontSize: 12, overflow: TextOverflow.visible)),
            ),
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
                  onPressed: () {}, child: const Icon(Icons.favorite_outline)),
            ],
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: itemList.length,
            prototypeItem: ListTile(
              leading: const Icon(
                Icons.browse_gallery_outlined,
                color: Colors.white70,
              ),
              title: Text(
                itemList.first.itemName,
                style: const TextStyle(color: Colors.white),
              ),
              trailing: const Icon(
                Icons.texture_outlined,
                color: Colors.white70,
              ),
            ),
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(
                  Icons.browse_gallery_outlined,
                  color: Colors.white70,
                ),
                title: Text(
                  itemList[index].itemName,
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: const Icon(
                  Icons.texture_outlined,
                  color: Colors.white70,
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}

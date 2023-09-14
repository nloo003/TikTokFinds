// ignore_for_file: file_names, unused_import, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:tiktok/model/item_model.dart';
import 'package:tiktok/pages/01_home_page.dart';
import 'package:tiktok/pages/06_1_wishlists_page.dart';
import 'package:tiktok/pages/07_friends_page.dart';
import 'package:tiktok/model/api.dart';
import 'package:tiktok/model/user_model.dart';
import 'package:tiktok/model/item_model.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'dart:convert';

import 'package:tiktok/pages/08_item_page.dart';
import 'package:tiktok/widgets/back_icon.dart';

class ProfilePageShop extends StatefulWidget {
  // const ProfilePageShop({super.key});
  final String? shopName;

  const ProfilePageShop({
    Key? key,
    required this.shopName
  }) : super(key: key);


  @override
  State<ProfilePageShop> createState() => _ProfilePageSelfState();
}

class _ProfilePageSelfState extends State<ProfilePageShop> {
  String userId = '64fbf5b43c612b13b658d6eb';
  UserModel user = UserModel("", "", "", [], [], '0', "");
  List<ItemModel> storeItems = [];
  ItemModel iter_item = ItemModel("", "", 0.0, "", "");

  @override
  void initState() {
    super.initState();
    // Call the fetchData function when the widget is initialized
    getShopItemsByStoreName(widget.shopName!).then((items) {
      setState(() {
        storeItems = items;
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
              widget.shopName!,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        leading: const BackIcon(),
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
              backgroundImage: NetworkImage("https://images.unsplash.com/photo-1595991209266-5ff5a3a2f008?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "@${widget.shopName!.replaceFirst(' ', '_')}",
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
              Row(
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
                          Text(user.followers!.length.toString(),
                              style: const TextStyle(color: Colors.white)),
                          const Text("Followers",
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
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
                  child: const Text("Follow"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueGrey)),
                  child: const Text("Message"),
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
              //                 itemStore: "ABC"
              //                    );
                              
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
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          //   child: ElevatedButton(
          //     onPressed: () {},
          //     style: ButtonStyle(
          //         backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
          //         foregroundColor: MaterialStateProperty.all(Colors.white),
          //         minimumSize:
          //             MaterialStateProperty.all<Size>(const Size(20, 20))),
          //     child: const Text("+ Add Bio",
          //         style:
          //             TextStyle(fontSize: 12, overflow: TextOverflow.visible)),
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                  onPressed: () {},
                  child: const Icon(Icons.shopping_bag)),
              // OutlinedButton(
              //     onPressed: () {}, child: const Icon(Icons.lock_outline)),
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
            itemCount: storeItems.length,
            // prototypeItem: ListTile(
            //   leading: const Icon(
            //     Icons.browse_gallery_outlined,
            //     color: Colors.white70,
            //   ),
            //   title: Text(
            //     storeItems.first.itemName!,
            //     style: const TextStyle(color: Colors.white),
            //   ),
            //   trailing: const Icon(
            //     Icons.texture_outlined,
            //     color: Colors.white70,
            //   ),
            // ),
            itemBuilder: (context, index) {
              final iter_item = storeItems[index];

              return GestureDetector(
                onTap: () {
                  debugPrint("clicked ${iter_item.itemName}");
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return ItemPage(
                        itemId: iter_item.itemId,
                        itemName: iter_item.itemName,
                        itemPrice: iter_item.itemPrice,
                        itemImage: iter_item.itemImage,
                        itemStore: iter_item.itemStore,
                      );
                    })
                  );
                },
                child: ListTile(
                  leading: Image.network(
                  iter_item.itemImage!,
                  height: 40.0,
                  width: 40,
                  // 'https://images.unsplash.com/photo-1529973625058-a665431328fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
                  fit: BoxFit.cover,
                  ),
                  title: Text(
                    iter_item.itemName!,
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: const Icon(
                    Icons.texture_outlined,
                    color: Colors.white70,
                  ),
                )
                
              );
            },
          )
        ]),
      ),
    );
  }
}

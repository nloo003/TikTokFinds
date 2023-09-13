// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:tiktok/widgets/back_icon.dart';
import '../model/item_model.dart';
import '../model/wishlist_model.dart';
import '../model/api.dart';
import '../model/user_model.dart';
import 'package:tiktok/pages/08_item_page.dart';

// Define a class to represent a wishlist item
class WishlistItemModel {
  final String itemName;
  final String itemDescription;
  final String itemImage;

  WishlistItemModel({
    required this.itemName,
    required this.itemDescription,
    required this.itemImage,
  });
}

class WishlistsPage extends StatefulWidget {
  // const WishlistsPage({super.key});
  final String? userId;
  final bool? indivList;
  final String? wishlistId;

  const WishlistsPage({
    Key? key,
    required this.userId,
    required this.indivList,
    required this.wishlistId,
  }) : super(key: key);

  @override
  State<WishlistsPage> createState() => _WishlistsPageState();
}

class _WishlistsPageState extends State<WishlistsPage> {
  List<WishlistModel> allWishlist = [];
  WishlistModel indivWishlist = WishlistModel("", "", "", [], "", "", "");
  ItemModel iter_item = ItemModel("", "", 0.0, "", "");
  UserModel user = UserModel("id", "", "handle", [], [], '0', "profilePicUrl");

  @override
  void initState() {
    super.initState();
    // Call the fetchData function when the widget is initialized
    getUserWishList(widget.userId!).then((items) {
      setState(() {
        allWishlist = items;
      });
    });
  }

  // add wishlist pop up
  // Future<void> _showAddWishlistDialog(BuildContext context) async {
  //   TextEditingController nameController = TextEditingController();
  //   TextEditingController descriptionController = TextEditingController();

  //   await showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Add Wishlist'),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //             TextField(
  //               controller: nameController,
  //               decoration: InputDecoration(labelText: 'Name'),
  //             ),
  //             TextField(
  //               controller: descriptionController,
  //               decoration: InputDecoration(labelText: 'Description'),
  //             ),
  //           ],
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop(); // Close pop up
  //             },
  //             child: Text('Cancel'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               // Validate and save the input values
  //               final name = nameController.text.trim();
  //               final description = descriptionController.text.trim();

  //               if (name.isNotEmpty) {
  //                 // Create and add a new wishlist
  //                 final newWishlist = WishlistModel(
  //                   name,
  //                   description,
  //                   'https://plus.unsplash.com/premium_photo-1683417272601-dbbfed0ed718?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1776&q=80', // Replace with a valid image URL
  //                   [],
  //                   widget.userId!, // creatorid
  //                   '', //creator name
  //                   DateTime.now().toString(),
  //                 );

  //                 // Add the new wishlist to the list
  //                 setState(() {
  //                   allWishlist.add(newWishlist);
  //                 });

  //                 Navigator.of(context).pop();
  //               }
  //             },
  //             child: Text('Add'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // debugPrint(widget.wishlistId);

    // If only want to display an individual list
    if (widget.indivList != null && widget.indivList == true) {
      for (WishlistModel wishlist in allWishlist) {
        if (wishlist.id == widget.wishlistId) {
          indivWishlist = wishlist;
          break;
        }
      }

      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: const BackIcon(),
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(
          itemCount: allWishlist.length,
          itemBuilder: (context, index) {
            final wishlist = allWishlist[index];
            // debugPrint("id ${wishlist.id}");
            // debugPrint("widget ${widget.wishlistId}");
            if (wishlist.id != widget.wishlistId) {
              return SizedBox
                  .shrink(); // Return an empty SizedBox to skip the item
            }

            final wishlistName = wishlist.name;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.network(
                          indivWishlist.wishListImage!,
                          // 'https://images.unsplash.com/photo-1529973625058-a665431328fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Public List",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            wishlistName!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 10,
                                backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1529973625058-a665431328fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                // LINK TO PROFILE
                                indivWishlist.creatorName!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: wishlist.items!.length,
                    itemBuilder: (context, index) {
                      final itemId = wishlist.items![index];
                      debugPrint(wishlist.items![index]);
                      return FutureBuilder<ItemModel>(
                          future: getItem(itemId),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              // Handle loading state
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              // Handle error state
                              return Text('Error: ${snapshot.error}');
                            } else {
                              final iter_item = snapshot.data;
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ItemPage(
                                          itemId: iter_item!.itemId,
                                          itemName: iter_item.itemName,
                                          itemPrice: iter_item.itemPrice,
                                          // itemDescription: iter_item.itemDescription,
                                          itemImage: iter_item.itemImage,
                                        ),
                                      ),
                                    );
                                  },
                                  child: WishlistItem(
                                    itemId: iter_item!.itemId,
                                    itemName: iter_item.itemName,
                                    itemPrice: iter_item.itemPrice,
                                    // itemDescription: item.itemDescription,
                                    itemImage: iter_item.itemImage,
                                  ));
                            }
                          });
                    },
                  ),
                ),
              ],
            );
          },
        ),
      );
    }

    // Display all user wishlists
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackIcon(),
        title: Text(
          "${user.name!}'s Finds",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              // Add wishlist button pressed, implement action here
              // _showAddWishlistDialog(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: allWishlist.length,
        itemBuilder: (context, index) {
          final wishlist = allWishlist[index];
          final wishlistName = wishlist.name;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(
                        wishlist.wishListImage!,
                        // 'https://images.unsplash.com/photo-1529973625058-a665431328fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Public List",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          wishlistName!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15.0),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: wishlist.items!.length,
                  itemBuilder: (context, index) {
                    final itemId = wishlist.items![index];
                    // debugPrint(wishlist.items![index]);
                    return FutureBuilder<ItemModel>(
                        future: getItem(itemId),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // Handle loading state
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            // Handle error state
                            return Text('Error: ${snapshot.error}');
                          } else {
                            final iter_item = snapshot.data;
                            return WishlistItem(
                              itemId: iter_item!.itemId,
                              itemName: iter_item.itemName,
                              itemPrice: iter_item.itemPrice,
                              // itemDescription: item.itemDescription,
                              itemImage: iter_item.itemImage,
                            );
                          }
                        });
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class WishlistItem extends StatelessWidget {
  final String? itemId;
  final String? itemName;
  final double? itemPrice;
  // final String? itemDescription;
  final String? itemImage;

  WishlistItem({
    required this.itemId,
    required this.itemName,
    required this.itemPrice,
    // required this.itemDescription,
    required this.itemImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: NetworkImage(itemImage!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemName!,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                "\$${itemPrice.toString()}",
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

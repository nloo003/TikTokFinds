// ignore_for_file: file_names, non_constant_identifier_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unnecessary_null_comparison
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
    getUser(widget.userId!).then(((value) {
      setState(() {
        user = value;
      });
    }));
  }

  void createWishlistAndUpdateWishlist(
      wishlistName, description, userId, userName, wishlistPicUrl) async {
    addWishlist(wishlistName, description, userId, userName, wishlistPicUrl);
    setState(() {
      final newWishlist = WishlistModel("abc", wishlistName, description, [],
          userId, userName, wishlistPicUrl);
      allWishlist.add(newWishlist);
    });
  }

  //add wishlist pop up
  Future<void> _showAddWishlistDialog(BuildContext context) async {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new Find'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close pop up
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Validate and save the input values
                final name = nameController.text.trim();
                final description = descriptionController.text.trim();

                if (name.isNotEmpty) {
                  // Create and add a new wishlist
                  // final newWishlist = WishlistModel(
                  //     "abc",
                  //     name,
                  //     description,
                  //     [],
                  //     widget.userId!, // creatorid
                  //     '', //creator name
                  //     "https://images.unsplash.com/photo-1585652757141-8837d676fac8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80");

                  createWishlistAndUpdateWishlist(
                      name,
                      description,
                      widget.userId!,
                      user.name!,
                      "https://images.unsplash.com/photo-1585652757141-8837d676fac8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80");

                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
    return;
  }

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
              return const SizedBox
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
                      const SizedBox(width: 10.0),
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
                          const SizedBox(height: 8.0),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            wishlistName!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            (wishlist.description!.length >
                                    48) // Adjust the character limit as needed
                                ? '${wishlist.description!.substring(0, 48)}...' // Truncate and add ellipsis
                                : wishlist.description!,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              // CircleAvatar(
                              //   radius: 10,
                              //   backgroundImage: NetworkImage(
                              //     'https://images.unsplash.com/photo-1529973625058-a665431328fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
                              //   ),
                              // ),
                              // SizedBox(
                              //   width: 10.0,
                              // ),
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
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              // Handle error state
                              return Text('Error: ${snapshot.error}');
                            } else {
                              final iter_item = snapshot.data;
                              return GestureDetector(
                                  onTap: () {
                                    debugPrint("clicked ${iter_item!.itemId}");
                                    if (iter_item != null &&
                                        iter_item.itemId != null) {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return ItemPage(
                                          itemId: iter_item.itemId,
                                          itemName: iter_item.itemName,
                                          itemPrice: iter_item.itemPrice,
                                          itemImage: iter_item.itemImage,
                                          itemStore: iter_item.itemStore,
                                        );
                                      }));
                                    }
                                  },
                                  child: WishlistItem(
                                    itemId: iter_item?.itemId,
                                    itemName: iter_item?.itemName,
                                    itemPrice: iter_item?.itemPrice ?? 0,
                                    // itemDescription: item.itemDescription,
                                    itemImage: iter_item?.itemImage,
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
          allWishlist.isNotEmpty
              ? "${allWishlist[0].creatorName!}'s Finds"
              : "Loading...",
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
              _showAddWishlistDialog(context);
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
                    const SizedBox(width: 10.0),
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
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            // Handle error state
                            return Text('Error: ${snapshot.error}');
                          } else {
                            final iter_item = snapshot.data;
                            return GestureDetector(
                                onTap: () {
                                  debugPrint("clicked ${iter_item!.itemId}");
                                  if (iter_item != null &&
                                      iter_item.itemId != null) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                      return ItemPage(
                                        itemId: iter_item.itemId,
                                        itemName: iter_item.itemName,
                                        itemPrice: iter_item.itemPrice,
                                        itemImage: iter_item.itemImage,
                                        itemStore: iter_item.itemStore,
                                      );
                                    }));
                                  }
                                },
                                child: WishlistItem(
                                  itemId: iter_item?.itemId,
                                  itemName: iter_item?.itemName,
                                  itemPrice: iter_item?.itemPrice ?? 0,
                                  // itemDescription: item.itemDescription,
                                  itemImage: iter_item?.itemImage,
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

// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:tiktok/model/item_model.dart';
import 'package:tiktok/widgets/back_icon.dart';
import 'model/wishlist_model.dart';
import 'model/api.dart';

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
  ////////////////////////////////////////////////////////////////
  // Mocked list of wishlists (replace this with actual API data)
  // final List<List<WishlistItemModel>> wishlists = [
  //   // Food Wishlist
  //   [
  //     WishlistItemModel(
  //       itemName: 'Coffee beans',
  //       itemDescription: 'Arabica, Roasted',
  //       itemImage:
  //           'https://images.unsplash.com/photo-1625021659159-f63f546d74a7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80',
  //     ),
  //   ],
  //   // Hall Items Wishlist
  //   [
  //     WishlistItemModel(
  //       itemName: 'Keyboard',
  //       itemDescription: 'Mechanical, Tactile switches, Ergonomic, Wireless',
  //       itemImage:
  //           'https://images.unsplash.com/photo-1595044426077-d36d9236d54a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
  //     ),
  //     WishlistItemModel(
  //       itemName: 'Shampoo',
  //       itemDescription: 'Natural ingredients, Everyday use',
  //       itemImage:
  //           'https://images.unsplash.com/photo-1629196869698-2ce173dacc24?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80',
  //     ),
  //     WishlistItemModel(
  //       itemName: 'Diffuser',
  //       itemDescription: 'Essential oil diffuser, Scented oil diffuser',
  //       itemImage:
  //           'https://images.unsplash.com/photo-1625480493029-abd01cd6061d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
  //     ),
  //   ],
  // ];
  /////////////////////////////////////////////////////////////

  List<WishlistModel> allWishlist = [];
  WishlistModel indivWishlist = WishlistModel("", "", "", [], "", "", "");
  ItemModel iter_item = ItemModel("", "", 0.0, "", "");

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

  @override
  Widget build(BuildContext context) {
    // debugPrint(widget.wishlistId);
    
    // If only want to display an individual list
    if (widget.indivList != null && widget.indivList == true) {
      for(WishlistModel wishlist in allWishlist) {
          if (wishlist.id == widget.wishlistId) {
            indivWishlist = wishlist;
            break;
          }
      }

      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: const BackIcon(),
          title: const Row(
            children: [
              // Image
              Text(
                "",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.black,
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
                              const CircleAvatar(
                                radius: 10,
                                backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1529973625058-a665431328fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
                                ),
                              ),
                              const SizedBox(width: 10.0,),
                              Text( // LINK TO PROFILE
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
                          if (snapshot.connectionState == ConnectionState.waiting) {
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
                        }
                      );       
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
        title: const Text(
          'Your Wishlists',
          style: TextStyle(
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
                child: Text(
                  wishlistName!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: wishlist.items!.length,
                  itemBuilder: (context, index) {
                    final item = wishlist.items![index];
                    return WishlistItem(
                      itemId: "item.itemId",
                      itemName: "item.itemName",
                      itemPrice: 0.0,
                      // itemDescription: item.itemDescription,
                      itemImage: "item.itemImage",
                    );
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

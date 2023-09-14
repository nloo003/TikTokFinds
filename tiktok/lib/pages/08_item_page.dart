import 'package:flutter/material.dart';
import 'package:tiktok/model/user_model.dart';
import 'package:tiktok/model/wishlist_model.dart';
import 'package:tiktok/pages/06_1_wishlists_page.dart';
import 'package:tiktok/widgets/back_icon.dart';
import '../model/item_model.dart';
import '../model/api.dart';
import 'package:tiktok/pages/05_2_profile_page_shop.dart';

class ItemPage extends StatefulWidget {
  final String? itemId;
  final String? itemName;
  final double? itemPrice;
  final String? itemImage;
  final String? itemStore;

  const ItemPage({
    Key? key,
    required this.itemId,
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
    required this.itemStore,

  }) : super(key:key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  String userId = "64fbf5b43c612b13b658d6eb";
  ItemModel item = ItemModel("", "", 0.0, "", "");
  List<WishlistModel> allWishlist = [];

  @override
  void initState() {
    super.initState();
    // Call the fetchData function when the widget is initialized
    getItem(widget.itemId!).then((e) {
      setState(() {
        item = e;
      });
    });
    getUserWishList(userId).then((wishlists) {
      setState(() {
        allWishlist = wishlists;
      });
    });
  }

  List<Map<String, String>> comments = [
    {"username": "@mxkiats", "comment": "Great product! I love it!"},
    {"username": "@mr.swaroop", "comment": "The quality is amazing."},
    {"username": "@commando.yeo", "comment": "I want this so bad!"},
    {"username": "@nicholas", "comment": "Good stuff!"},
    {"username": "@kaikai", "comment": "Bought this multiple times!"},
  ];

  List<Map<String, dynamic>> relatedItems = [
    {
      "itemName": "Sleek table lamp",
      "itemPrice": 20.99,
      "itemImage":
          "https://images.unsplash.com/photo-1558745909-9368b144feb8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1064&q=80",
    },
    {
      "itemName": "Adjustable lamp",
      "itemPrice": 15.99,
      "itemImage":
          "https://images.unsplash.com/photo-1570974802254-4b0ad1a755f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackIcon(),
        backgroundColor: Colors.black,
        title: Text(item.itemName!),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: GestureDetector(
              onTap: () {
                // like
              },
              child: const Icon(Icons.favorite_outline),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 16, 5),
            child: GestureDetector(
              onTap: () {
                // share
              },
              child: const Icon(Icons.share),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display item image
            Image.network(
              widget.itemImage!,
              width: double.infinity,
              height: 300.0,
              fit: BoxFit.cover,
            ),

            // Display item name and price
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.itemName!,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "\$${item.itemPrice?.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),

            // Comments Section
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Comments (5)",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  for (var comment in comments)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          Text(
                            "${comment['username']}: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(comment['comment'] ?? ""),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      debugPrint("clicked");
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return ProfilePageShop(
                            shopName: widget.itemStore
                          );
                        })
                      );
                    },
                    child: const Text("Visit shop")
                  ),
                  const SizedBox(width:10.0),
                  ElevatedButton(
                    onPressed: (){
                      debugPrint("clicked");
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Add to"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                for (WishlistModel wl in allWishlist)
                                  ListTile(
                                    title: Text("•  ${wl.name!}"),
                                    onTap: () {
                                      // handle
                                      addItemToWishlist(wl.id!, widget.itemId!);
                                      Navigator.of(context).pop();
                                    },
                                  )
                              ]
                            )
                          );
                        }
                      );
                    }, 
                    child: const Text("Add to Finds")
                  ),
                  const SizedBox(width:10.0),
                  ElevatedButton(
                    onPressed: (){
                      debugPrint("clicked");
                    }, 
                    child: const Text("Add to cart")
                  )
                ],
              )
            ),
            // Related Items Section
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Related Items",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Display related items here
                  for (var iterItem in relatedItems)
                    ListTile(
                      leading: Image.network(
                        iterItem['itemImage'],
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                      title: Text(iterItem['itemName']),
                      subtitle: Text(
                        "\$${iterItem['itemPrice'].toStringAsFixed(2)}",
                      ),
                      onTap: () {
                        // Click to related item page
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

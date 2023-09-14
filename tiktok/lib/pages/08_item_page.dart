import 'package:flutter/material.dart';
import 'package:tiktok/widgets/back_icon.dart';
import '../model/item_model.dart';
import '../model/api.dart';

class ItemPage extends StatefulWidget {
  final String? itemId;
  final String? itemName;
  final double? itemPrice;
  final String? itemImage;

  const ItemPage({
    Key? key,
    required this.itemId,
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
  }) : super(key:key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  ItemModel item = ItemModel("", "", 0.0, "", "");

  @override
  void initState() {
    super.initState();
    // Call the fetchData function when the widget is initialized
    getItem(widget.itemId!).then((e) {
      setState(() {
        item = e;
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
          //   Padding(
          //     padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          //     child: GestureDetector(
          //       onTap: () {},
          //       child: const Icon(Icons.favorite_outline),
          //     ),
          //   ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          //   child: GestureDetector(
          //     onTap: () {
          //       // add to cart
          //     },
          //     child: const Icon(Icons.add_shopping_cart),
          //   ),
          // ),
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
                      
                    },
                    child: const Text("Visit shop")
                  ),
                  SizedBox(width:10.0),
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

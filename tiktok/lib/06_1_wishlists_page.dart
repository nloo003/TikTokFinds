// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tiktok/widgets/back_icon.dart';

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
  const WishlistsPage({super.key});

  @override
  State<WishlistsPage> createState() => _WishlistsPageState();
}

class _WishlistsPageState extends State<WishlistsPage> {
  ////////////////////////////////////////////////////////////////
  // Mocked list of wishlists (replace this with actual API data)
  final List<List<WishlistItemModel>> wishlists = [
    // Food Wishlist
    [
      WishlistItemModel(
        itemName: 'Coffee beans',
        itemDescription: 'Arabica, Roasted',
        itemImage:
            'https://images.unsplash.com/photo-1625021659159-f63f546d74a7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80',
      ),
    ],
    // Hall Items Wishlist
    [
      WishlistItemModel(
        itemName: 'Keyboard',
        itemDescription: 'Mechanical, Tactile switches, Ergonomic, Wireless',
        itemImage:
            'https://images.unsplash.com/photo-1595044426077-d36d9236d54a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
      ),
      WishlistItemModel(
        itemName: 'Shampoo',
        itemDescription: 'Natural ingredients, Everyday use',
        itemImage:
            'https://images.unsplash.com/photo-1629196869698-2ce173dacc24?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80',
      ),
      WishlistItemModel(
        itemName: 'Diffuser',
        itemDescription: 'Essential oil diffuser, Scented oil diffuser',
        itemImage:
            'https://images.unsplash.com/photo-1625480493029-abd01cd6061d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
      ),
    ],
  ];
  /////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
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
        itemCount: wishlists.length,
        itemBuilder: (context, index) {
          final wishlist = wishlists[index];
          final wishlistName =
              index == 0 ? "Food Wishlist" : "Hall Items Wishlist";
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  wishlistName,
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
                  itemCount: wishlist.length,
                  itemBuilder: (context, index) {
                    final item = wishlist[index];
                    return WishlistItem(
                      itemName: item.itemName,
                      itemDescription: item.itemDescription,
                      itemImage: item.itemImage,
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
  final String itemName;
  final String itemDescription;
  final String itemImage;

  WishlistItem({
    required this.itemName,
    required this.itemDescription,
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
                image: NetworkImage(itemImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemName,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                itemDescription,
                style: const TextStyle(
                  fontSize: 14.0,
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

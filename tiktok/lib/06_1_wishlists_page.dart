// ignore_for_file: file_names
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tiktok/06_wishlist_page.dart';

class WishlistPage extends StatefulWidget {
  Wishlist wishlist = const Wishlist(
    wishListName: 'Gadgets',
    wishListDescription: 'Recommended Gadgets',
    wishListImage:
        'https://images.unsplash.com/photo-1595044426077-d36d9236d54a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
    wishListItemsList: [
      WishlistItem(
        itemName: 'Keyboard',
        itemDescription: 'Mechanical, Tactile switches, Ergonomic, Wireless',
        itemImage:
            'https://images.unsplash.com/photo-1595044426077-d36d9236d54a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
      ),
      WishlistItem(
        itemName: 'Shampoo',
        itemDescription: 'Natural ingredients, Everyday use',
        itemImage:
            'https://images.unsplash.com/photo-1629196869698-2ce173dacc24?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80',
      )
    ],
  );

  WishlistPage({super.key, required this.wishlist});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  // For testing
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Wishlist',
          style: TextStyle(
            color: Colors.white, // Text color
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.black, // Icon color
        ),
      ),
      body: FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Wishlist(
                wishListName: 'Gadgets',
                wishListDescription: 'Recommended Gadgets',
                wishListImage:
                    'https://images.unsplash.com/photo-1595044426077-d36d9236d54a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
                wishListItemsList: [
                  WishlistItem(
                    itemName: 'Keyboard',
                    itemDescription:
                        'Mechanical, Tactile switches, Ergonomic, Wireless',
                    itemImage:
                        'https://images.unsplash.com/photo-1595044426077-d36d9236d54a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
                  ),
                  WishlistItem(
                    itemName: 'Shampoo',
                    itemDescription: 'Natural ingredients, Everyday use',
                    itemImage:
                        'https://images.unsplash.com/photo-1629196869698-2ce173dacc24?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80',
                  )
                ],
              ),
              Wishlist(
                wishListName: 'Gadget Pt 2',
                wishListDescription: 'More Recommended Gadgets!',
                wishListImage:
                    'https://images.unsplash.com/photo-1625021659159-f63f546d74a7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80',
                wishListItemsList: [
                  WishlistItem(
                    itemName: 'Coffee beans',
                    itemDescription: 'Arabica, Roasted',
                    itemImage:
                        'https://images.unsplash.com/photo-1625021659159-f63f546d74a7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80',
                  ),
                  WishlistItem(
                    itemName: 'Diffuser',
                    itemDescription:
                        'Essential oil diffuser, Scented oil diffuser',
                    itemImage:
                        'https://images.unsplash.com/photo-1625480493029-abd01cd6061d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Wishlist extends StatelessWidget {
  final String wishListName;
  final String wishListDescription;
  final String wishListImage;
  final List<WishlistItem> wishListItemsList;

  const Wishlist({
    super.key,
    required this.wishListName,
    required this.wishListDescription,
    required this.wishListImage,
    required this.wishListItemsList,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => WishlistItemsPage(
                      wishListItemsListObj: wishListItemsList,
                    )));
          },
          child: Row(
            children: [
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(wishListImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wishListName,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    wishListDescription,
                    style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

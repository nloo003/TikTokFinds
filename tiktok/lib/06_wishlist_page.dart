// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:tiktok/widgets/back_icon.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
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
        automaticallyImplyLeading: false,
        leading: const BackIcon(),
      ),
      body: FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              ),
              WishlistItem(
                itemName: 'Coffee beans',
                itemDescription: 'Arabica, Roasted',
                itemImage:
                    'https://images.unsplash.com/photo-1625021659159-f63f546d74a7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80',
              ),
              WishlistItem(
                itemName: 'Diffuser',
                itemDescription: 'Essential oil diffuser, Scented oil diffuser',
                itemImage:
                    'https://images.unsplash.com/photo-1625480493029-abd01cd6061d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WishlistItem extends StatelessWidget {
  final String itemName;
  final String itemDescription;
  final String itemImage;

  const WishlistItem({
    super.key,
    required this.itemName,
    required this.itemDescription,
    required this.itemImage,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
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
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  itemDescription,
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
    );
  }
}

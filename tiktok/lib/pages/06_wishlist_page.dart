// ignore_for_file: file_names
// import 'package:flutter/material.dart';

// class WishlistItemModel {
//   final String itemName;
//   final String itemDescription;
//   final String itemImage;

//   WishlistItemModel({
//     required this.itemName,
//     required this.itemDescription,
//     required this.itemImage,
//   });
// }

// class Wishlist {
//   final String name;
//   final List<WishlistItemModel> items;
  
//   Wishlist({
//     required this.name,
//     required this.items,
//   });
// }

// class WishlistPage extends StatefulWidget {
//   final Wishlist wishlist;

//   WishlistPage({
//     required this.wishlist,
//   });

//   @override
//   State<WishlistPage> createState() => _WishlistPageState();
// }

// class _WishlistPageState extends State<WishlistPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Your Wishlist',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.black,
//         iconTheme: IconThemeData(
//           color: Colors.black,
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: widget.wishlist.items.length,
//         itemBuilder: (context, index) {
//           final item = widget.wishlist.items[index];
//           return WishlistItem(
//             itemName: item.itemName,
//             itemDescription: item.itemDescription,
//             itemImage: item.itemImage,
//           );
//         },
//       ),
//     );
//   }
// }

// class WishlistItem extends StatelessWidget {
//   final String itemName;
//   final String itemDescription;
//   final String itemImage;

//   WishlistItem({
//     required this.itemName,
//     required this.itemDescription,
//     required this.itemImage,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 16.0),
//       child: Row(
//         children: [
//           Container(
//             width: 80.0,
//             height: 80.0,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8.0),
//               image: DecorationImage(
//                 image: NetworkImage(itemImage),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SizedBox(width: 16.0),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 itemName,
//                 style: TextStyle(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 4.0),
//               Text(
//                 itemDescription,
//                 style: TextStyle(
//                   fontSize: 14.0,
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: WishlistPage(
//       wishlist: Wishlist(
//         name: 'Food Wishlist',
//         items: [
//           WishlistItemModel(
//             itemName: 'Coffee beans',
//             itemDescription: 'Arabica, Roasted',
//             itemImage:
//                 'https://images.unsplash.com/photo-1625021659159-f63f546d74a7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80',
//           ),
//         ],
//       ),
//     ),
//   ));
// }

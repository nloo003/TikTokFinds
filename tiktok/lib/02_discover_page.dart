// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'dart:math';
import 'model/wishlist_model.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {

  List<String> hintTextList = ["iPhone 11 pro case", "Travel adapter", ];
  static List<WishlistModel> wishlistList = [
    WishlistModel("atitle", "adesc", "acreatorId", "acreatorName", "https://images.unsplash.com/photo-1529973625058-a665431328fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80"),
    WishlistModel("btitle", "bdesc", "bcreatorId", "bcreatorName", "https://images.unsplash.com/photo-1529973625058-a665431328fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80"),
    WishlistModel("ctitle", "cdesc", "ccreatorId", "ccreatorName", "https://images.unsplash.com/photo-1529973625058-a665431328fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80"),
  ];
  List<WishlistModel> displayList = List.from(wishlistList);
  final _random = Random();
  String hintWord = "";
  bool hintWordSet = false;

  void updateList(String value) {
    setState(() {
      displayList = wishlistList.where((element) => 
        element.name!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!hintWordSet){
      hintWord = hintTextList[_random.nextInt(hintTextList.length)];
      hintWordSet = true;
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 30.0, right: 16.0, left: 10.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios), // Back button icon
                  onPressed: () {
                    Navigator.pop(context); // Add navigation logic here
                  },
                ),
                const SizedBox(width: 5.0), // Gap between back button and search bar
                Expanded(
                  child: Container(
                    constraints: const BoxConstraints(
                      maxHeight: 40.0
                    ),
                    child: Center(
                      child: TextField(
                        onChanged: (value) => updateList(value),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: const EdgeInsets.only(top: 5.0),
                          hintText: hintWord,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: const Color.fromARGB(255, 249, 85, 85),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                TextButton(
                  onPressed: () {
                    // debugPrint('Click on Search');
                    // query = '';
                  },
                  child: const Text(
                    'Search',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 249, 85, 85)
                    )
                  )
                )
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 10.0),
              itemCount: displayList.length,
              itemBuilder: (context, index) => ListTile(
                contentPadding: const EdgeInsets.all(8.0),
                title: Text(
                  displayList[index].name!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0, 
                  ),
                ),
                subtitle: Text(
                  displayList[index].description!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  displayList[index].creatorName!
                ),
                leading: SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.network(
                    displayList[index].imageUrl!,
                    fit: BoxFit.cover,
                  ),
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}

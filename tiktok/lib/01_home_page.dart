// ignore_for_file: file_names, unused_import, use_key_in_widget_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:tiktok/06_1_wishlists_page.dart';
import 'package:tiktok/06_wishlist_page.dart';

class HomePage extends StatelessWidget {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // image content
          Image.network(
            'https://images.unsplash.com/photo-1529973625058-a665431328fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 25, 0, 0),
                child: Row(children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.live_tv_outlined,
                      color: Colors.white,
                    ),
                  )
                ]),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1529973625058-a665431328fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.person_add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // TODO: person add action
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.white,
                    ),
                    onPressed: () {
                      // like action
                      isLiked = !isLiked;
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.comment,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // comment action
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // share action
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // view profile action
                    },
                  ),
                ],
              ),
            ),
          ),
          // bottom left corner
          const Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        '@mkiats',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        'its the time of the year! 🎅🎄 #christmas #santa #gifts #snow',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        '🎵 All I Want For Christmas Is You',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  
                  // GestureDetector(
                  //   onTap: () {
                  //     // redirect to the Wishlist page here
                  //     Navigator.of(context).push(
                  //       MaterialPageRoute(
                  //         builder: (context) => WishlistPage(),
                  //       ),
                  //     );
                  //   },
                  //   child: const Text(
                  //     '🎁 Wishlist',
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 14.0,
                  //   ),))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: unused_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:tiktok/pages/03_create_story_page.dart';
import 'package:tiktok/pages/02_discover_page.dart';
import 'package:tiktok/pages/04_inbox_page.dart';
import 'package:tiktok/pages/05_0_profile_page_self.dart';
import 'package:tiktok/pages/01_home_page.dart';
import 'package:tiktok/pages/05_1_profile_page_others.dart';
import 'package:tiktok/pages/05_2_profile_page_shop.dart';
import 'package:tiktok/pages/06_1_wishlists_page.dart';
import 'package:tiktok/pages/06_wishlist_page.dart';
import 'package:tiktok/pages/06_1_wishlists_page.dart';
import 'package:tiktok/pages/07_friends_page.dart';
import 'package:tiktok/pages/07_friends_page_temp.dart';
import 'package:tiktok/pages/08_item_page.dart';
import 'package:tiktok/widgets/upload_icon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({Key? key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  final pages = [
    HomePage(),
    const DiscoverPage(),
    // const CreateStoryPage(),
    // const InboxPage(),
    // WishlistPage(),
    // const WishlistsPage(),
    // const FriendPageState(userId: ""),
    const InboxPage(),
    // const FriendPageTemp(userIdList: ["64faace4f139f050c81cdab1", "64faca4d074f7f2492bcfbbb"]),
    // const WishlistPage(),
    // const ProfilePageOthers(userId: "64fbf5b43c612b13b658d6eb"),
    const ProfilePageShop(),
    const ProfilePageSelf(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(
                const TextStyle(color: Colors.white70))),
        child: NavigationBar(
          backgroundColor: Colors.black,
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.home,
                color: Colors.white70,
              ),
              label: 'Home',
            ),
            NavigationDestination(
                icon: Icon(
                  Icons.search,
                  color: Colors.white70,
                ),
                label: 'Discover'),
            NavigationDestination(
                icon: InkWell(
                  child: UploadIcon(),
                ),
                label: 'New'),
            NavigationDestination(
                icon: Icon(
                  Icons.inbox,
                  color: Colors.white70,
                ),
                label: 'Inbox'),
            NavigationDestination(
                icon: Icon(
                  Icons.man,
                  color: Colors.white70,
                ),
                label: 'Profile'),
          ],
          onDestinationSelected: (int index) {
            setState(() {
              currentPage = index;
            });
          },
          selectedIndex: currentPage,
        ),
      ),
    );
  }
}

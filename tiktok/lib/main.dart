// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:tiktok/03_create_story_page.dart';
import 'package:tiktok/02_discover_page.dart';
import 'package:tiktok/04_inbox_page.dart';
import 'package:tiktok/05_0_profile_page_self.dart';
import 'package:tiktok/01_home_page.dart';
import 'package:tiktok/05_1_profile_page_others.dart';
import 'package:tiktok/06_wishlist_page.dart';
import 'package:tiktok/widgets/upload_icon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  final pages = [
    HomePage(),
    const DiscoverPage(),
    const CreateStoryPage(),
    // const InboxPage(),
    const WishlistPage(),
    const ProfilePageOthers(),
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
                  Icons.card_giftcard_outlined,
                  color: Colors.white70,
                ),
                label: 'Wishlist'),
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

import 'package:flutter/material.dart';
import 'package:tiktok/03_create_story_page.dart';
import 'package:tiktok/02_discover_page.dart';
import 'package:tiktok/04_inbox_page.dart';
import 'package:tiktok/05_0_profile_page_self.dart';
import 'package:tiktok/01_home_page.dart';
import 'package:tiktok/05_1_profile_page_others.dart';
import 'package:tiktok/06_wishlist_page.dart';

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
    const CreateStoryPage(),
    const InboxPage(),
    WishlistPage(),
    const ProfilePageOthers(),
    const ProfilePageSelf(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.search_outlined), label: 'Discover'),
          NavigationDestination(
              icon: Icon(Icons.plus_one_outlined), label: 'New'),
          NavigationDestination(
              icon: Icon(Icons.inbox_outlined), label: 'Inbox'),
          NavigationDestination(
              icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  CustomBottomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // profile page implementation
    return Center(
      child: Text('Profile Screen'),
    );
  }
}

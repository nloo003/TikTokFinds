import 'package:flutter/material.dart';

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
  final List<Widget> pages = [
    HomePage(),
    ProfilePage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: Row(
            children: [
              const Text('Tiktok'),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Add your search action here
                },
              ),
            ],
          ),
          backgroundColor: Colors.black,
          titleTextStyle: const TextStyle(color: Colors.white),
        ),
      ),
      body: pages[currentPage],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentPage,
        onTap: onTabTapped,
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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Video or image content
        Image.network(
          'https://images.unsplash.com/photo-1529973625058-a665431328fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        // Icons at the right side
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.person_add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // person add action
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // like action
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.comment,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // comment action
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // share action
                  },
                ),
                IconButton(
                  icon: Icon(
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
        // Text at the bottom left corner
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomLeft, // Align text to the bottom left
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.end, // Align text to the bottom
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
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
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      'its the time of the year! 🎅🎄 #christmas #santa #gifts #snow',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      '🎵 All I Want For Christmas Is You',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Text(
                    '🎁 Wishlist',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
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

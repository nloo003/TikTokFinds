// ignore_for_file: file_names
import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {

  static List<String> initDisplayList = ["hi", "hello"];
  String word = "";

  void updateWord(String value) {
    setState(() {
      // displayList = mainList.where((element) => 
      //   element.toLowerCase().contains(value.toLowerCase())).toList();
      word = value;
    });
    debugPrint(word);
  }

  @override
  Widget build(BuildContext context) {
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
                        onChanged: (value) => updateWord(value),
                        enableInteractiveSelection: false,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: const Color.fromARGB(255, 249, 85, 85),
                          // Add your search logic here
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
          const Expanded(
            child: Column(
              children: [
                SizedBox(height: 10.0),
                Row(
                  children: [
                    SizedBox(width: 15.0),
                    Text(
                      'You may like',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black
                      )
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: [
                    SizedBox(width: 20.0),
                    Text(
                      '•  ',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                        color: Colors.black
                      )
                    ),
                    Text(
                      'iPhone 11 pro case',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                        color: Colors.black
                      )
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: [
                    SizedBox(width: 20.0),
                    Text(
                      '•  ',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                        color: Colors.black
                      )
                    ),
                    Text(
                      'Travel adapter',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                        color: Colors.black
                      )
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
              ],
            )
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:tiktok/widgets/back_icon.dart';
import '../model/api.dart';
import '06_1_wishlists_page.dart';
import '../model/user_model.dart';

class ProfilePageOthers extends StatefulWidget {
  // const ProfilePageOthers({super.key});
  final String? userId;

  const ProfilePageOthers({
    Key? key,
    required this.userId
  }) : super(key: key);

  @override
  State<ProfilePageOthers> createState() => _ProfilePageOthersState();
}

class _ProfilePageOthersState extends State<ProfilePageOthers> {
  UserModel user = UserModel("", "", "", [], [], '0', "");  

  @override
  void initState() {
    super.initState();
    // Call the fetchData function when the widget is initialized
    getUser(widget.userId!).then((item) {
      setState(() {
        user = item;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackIcon(),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: GestureDetector(
            onTap: () {
              debugPrint("Username clicked");
            },
            child: Text(
              user.name.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.notifications_outlined,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.link_outlined,
              ),
            ),
          )
        ],
        backgroundColor: Colors.black,
      ),
      body: FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 1,
        child: Container(
          color: Colors.black,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  user.profilePicUrl!
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user.handle!,
                  style: const TextStyle(color: Colors.white),
                ),
                const Icon(
                  Icons.qr_code,
                  color: Colors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 15, 20, 5),
                  child: Column(
                    children: [
                      Text(user.following!.length.toString(),
                          style: const TextStyle(color: Colors.white)),
                      const Text("Following",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                  child: Column(
                    children: [
                      Text(user.followers!.length.toString(),
                          style: const TextStyle(color: Colors.white)),
                      const Text("Followers",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(15, 20, 5, 5),
                  child: Column(
                    children: [
                      Text("789", style: TextStyle(color: Colors.white)),
                      Text("Likes", style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey)),
                    child: const Text("+ Add Friend"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return WishlistsPage(
                              userId: user.id,
                              indivList: false,
                              wishlistId: "",
                            );
                          }),
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blueGrey)),
                      child: const Text("Finds")),
                )
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     style: ButtonStyle(
            //         backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
            //         foregroundColor: MaterialStateProperty.all(Colors.white),
            //         minimumSize:
            //             MaterialStateProperty.all<Size>(const Size(20, 20))),
            //     child: const Text("+ Add Bio",
            //         style: TextStyle(
            //             fontSize: 12, overflow: TextOverflow.visible)),
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                    onPressed: () {},
                    child: const Icon(Icons.browse_gallery_outlined)),
                OutlinedButton(
                    onPressed: () {}, child: const Icon(Icons.lock_outline)),
                OutlinedButton(
                    onPressed: () {},
                    child: const Icon(Icons.collections_outlined)),
                OutlinedButton(
                    onPressed: () {},
                    child: const Icon(Icons.favorite_outline)),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

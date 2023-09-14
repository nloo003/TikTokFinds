// // ignore_for_file: file_names, unused_import

// import 'package:http/http.dart' as http;
// import 'dart:math';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:tiktok/pages/05_1_profile_page_others.dart';
// import 'package:tiktok/model/user_model.dart';
// import 'package:tiktok/widgets/back_icon.dart';

// import '../model/api.dart';

// class User {
//   final String username;
//   final String handle;

//   const User({required this.username, required this.handle});
// }

// class FriendPageTemp extends StatefulWidget {
//   // const FriendPageFactory({super.key});
//   final List<String>? userIdList;

//   const FriendPageTemp({Key? key, required this.userIdList}) : super(key: key);

//   @override
//   State<FriendPageTemp> createState() => _FriendPageTemp();
// }

// class _FriendPageTemp extends State<FriendPageTemp> {
//   List<UserModel> userList = [];

//   String userId = '64fbf5b43c612b13b658d6eb';
//   UserModel user = UserModel("", "", "", [], [], '0', "");
//   @override
//   void initState() {
//     super.initState();
//     // Call the fetchData function when the widget is initialized
//     getUser(userId).then((item) {
//       setState(() {
//         user = item;
//       });
//     });

//     for (int i = 0; i < user.following!.length; i++) {
//       String tempId = widget.userIdList![i];
//       UserModel tempUser =
//           UserModel("id", "name", "handle", [], [], "likes", "profilePicUrl");
//       getUser(tempId).then((value) {
//         setState(() {
//           tempUser = value;
//         });
//       });
//       debugPrint(i.toString());
//       debugPrint(tempUser.name);
//       userList.add(tempUser);
//     }

//     // for (int i = 0; i < widget.userIdList.length; i++) {
//     //   debugPrint("For loop start");
//     //   setState(() {
//     //     getUser(widget.userIdList[i]).then((value) {
//     //       userList.add(value);
//     //     });
//     //   });

//     //   // getUser(widget.userIdList[i]).then((item) {
//     //   //   debugPrint("GetUser");
//     //   //   setState(() async {
//     //   //     userList!.add(item);
//     //   //   });
//     //   // });
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     debugPrint(widget.userIdList!.first.toString());

//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         leading: const BackIcon(),
//         backgroundColor: Colors.black,
//         title: Text(user.name!),
//         centerTitle: true,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
//             child: GestureDetector(
//               onTap: () {},
//               child: const Icon(Icons.add_reaction_outlined),
//             ),
//           ),
//         ],
//       ),
//       body: Container(
//         color: Colors.black,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Align(
//               alignment: Alignment.topCenter,
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
//                       child: Text(
//                         "Following " + userList.length.toString(),
//                         style: const TextStyle(
//                             color: Colors.white70, fontSize: 15),
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
//                       child: Text(
//                         "Followers " + userList.length.toString(),
//                         style: const TextStyle(
//                             color: Colors.white70, fontSize: 15),
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
//                       child: Text(
//                         "Friends " + userList.length.toString(),
//                         style: const TextStyle(
//                             color: Colors.white70, fontSize: 15),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: SearchBar(
//                 onSubmitted: (value) {},
//                 hintText: "Search Users",
//                 backgroundColor: MaterialStateProperty.all(Colors.white70),
//                 padding: const MaterialStatePropertyAll(
//                     EdgeInsets.fromLTRB(5, 5, 5, 5)),
//                 leading: const Icon(
//                   Icons.search_outlined,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: widget.userIdList!.length,
//                 prototypeItem: ListTile(
//                   title: Text(userList.first.name!),
//                   subtitle: Text(userList.first.handle!),
//                   trailing: const Icon(Icons.notifications_outlined),
//                   leading: GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(builder: (BuildContext context) {
//                           return ProfilePageOthers(
//                             userId: userList.first.id,
//                           );
//                         }),
//                       );
//                     },
//                     child: CircleAvatar(
//                       radius: 20,
//                       backgroundImage:
//                           NetworkImage(userList.first.profilePicUrl.toString()),
//                     ),
//                   ),
//                 ),
//                 itemBuilder: ((context, index) {
//                   return ListTile(
//                     title: Text(userList[index].name!),
//                     subtitle: Text(userList[index].handle!),
//                     trailing: const Icon(Icons.notifications_outlined),
//                     leading: GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(builder: (BuildContext context) {
//                             return ProfilePageOthers(
//                               userId: userList[index].id,
//                             );
//                           }),
//                         );
//                       },
//                       child: CircleAvatar(
//                         radius: 20,
//                         backgroundImage: NetworkImage(
//                             userList[index].profilePicUrl.toString()),
//                       ),
//                     ),
//                   );
//                 })),
//           ],
//         ),
//       ),
//     );
//   }
// }

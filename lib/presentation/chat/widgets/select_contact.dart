// import 'package:chat/domain/user/user.dart';
// import 'package:flutter/material.dart';
//
// class SelectContact extends StatefulWidget {
//   const SelectContact({Key? key}) : super(key: key);
//
//   @override
//   State<SelectContact> createState() => _SelectContactState();
// }
//
// class _SelectContactState extends State<SelectContact> {
//   List<User> contacts = [
//     User(name: 'Flutter Engineer', selected: false),
//     User(name: 'Backend Developer', selected: false),
//     User(name: 'Project Manager', selected: false),
//   ];
//
//   List<User> selectedContacts = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff1b252f),
//       appBar: AppBar(
//         backgroundColor: Color(0xff222e3a),
//         title: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Select user',
//               style: TextStyle(
//                 fontSize: 19,
//               ),
//             ),
//             Text('256 users', style: TextStyle(fontSize: 14, color: Colors.grey),)
//           ],
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: contacts.length,
//         itemBuilder: (context, index) {
//           final user = contacts[index];
//           return CheckboxListTile(
//             title: Text(user.name, style: TextStyle(color: Colors.white),),
//             value: user.selected,
//             onChanged: (bool? value) {
//               setState(() {
//                 user.selected = value ?? false;
//                 if (value == true) {
//                   selectedContacts.add(user);
//                 } else {
//                   selectedContacts.remove(user);
//                 }
//               });
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _createGroup();
//         },
//         child: Icon(Icons.group),
//       ),
//     );
//   }
//
//   void _createGroup() {
//     print('Created group with: ${selectedContacts.map((user) => user.name).toList()}');
//   }
// }
//

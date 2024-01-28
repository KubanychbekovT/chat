import 'package:chat/domain/user/user.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  // List<User> contacts = [
  //   User(nickname: 'Flutter Engineer', selected: false, email: 'best@gmail.com'),
  //   User(nickname: 'Backend Developer', selected: false, email: 'keybor@gmail.com'),
  //   User(nickname: 'Project Manager', selected: false, email: '111@gmail.com'),
  // ];
  //
  // List<User> selectedContacts = [];
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: const Color(0xff1b252f),
  //     appBar: AppBar(
  //       iconTheme: IconThemeData(color: Colors.white),
  //       backgroundColor: const Color(0xff222e3a),
  //       title: const Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             'Select user',
  //             style: TextStyle(
  //               fontSize: 20,
  //               color: Colors.white,
  //             ),
  //           ),
  //           Text('256 users', style: TextStyle(fontSize: 14, color: Colors.grey),)
  //         ],
  //       ),
  //     ),
  //     body: ListView.builder(
  //       itemCount: contacts.length,
  //       itemBuilder: (context, index) {
  //         final user = contacts[index];
  //         return CheckboxListTile(
  //           title: Text(user.nickname, style: const TextStyle(color: Colors.white),),
  //           value: user.selected,
  //           onChanged: (bool? value) {
  //             setState(() {
  //               user.selected = value ?? false;
  //               if (value == true) {
  //                 selectedContacts.add(user);
  //               } else {
  //                 selectedContacts.remove(user);
  //               }
  //             });
  //           },
  //         );
  //       },
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: selectedContacts.isNotEmpty ? _createGroup : null,
  //       child: const Icon(Icons.group),
  //     ),
  //     bottomNavigationBar: selectedContacts.isNotEmpty ? _buildSelectedContactsInfo() : null,
  //   );
  // }
  //
  // Widget _buildSelectedContactsInfo() {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //     color: Colors.grey[900],
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           'Selected Contacts: ${selectedContacts.length}',
  //           style: const TextStyle(color: Colors.white),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             setState(() {
  //               selectedContacts.clear();
  //               contacts.forEach((user) {
  //                 user.selected = false;
  //               });
  //             });
  //           },
  //           child: const Text(
  //             'Clear All',
  //             style: TextStyle(color: Colors.blue),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // void _createGroup() {
  //   print('Created group with: ${selectedContacts.map((user) => user.nickname).toList()}');
  // }
}

import 'package:chat/presentation/chat/widgets/button_card.dart';
import 'package:chat/presentation/chat/widgets/user_card.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1b252f),
    appBar: AppBar(
      backgroundColor: Color(0xff222e3a),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           'Select user',
           style: TextStyle(
             fontSize: 19,
           ),
          ),
          Text('256 users', style: TextStyle(fontSize: 14, color: Colors.grey),)
        ],
      ),
    ),
      body: ListView( children: [
        ButtonCard(),
        Divider(),
        UserCard(),
      Divider(),
      UserCard(),
      Divider(),
      UserCard(),
      Divider(),
      UserCard(),
      Divider(),
      ],),
    );
  }
}

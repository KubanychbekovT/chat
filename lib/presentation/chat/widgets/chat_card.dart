import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  final String message;

  const ChatCard({required this.message, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Color(0xff222e3a),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          message,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
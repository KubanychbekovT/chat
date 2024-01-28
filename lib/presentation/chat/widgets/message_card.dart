import 'package:chat/domain/chat/message/message.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final Message message;

  const MessageCard({required this.message, Key? key}) : super(key: key);

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message.text,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 4),
            Text(
              '${message.createdAt}',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:chat/domain/chat/chat/chat.dart';
import 'package:chat/presentation/chat/chat_dialog/chat_dialog_page.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatDialogPage(
                    chat: chat,
                  )),
        );
      },
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.grey,
      ),
      title: Text(
        chat.withUser!.name,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
      subtitle: Row(
        children: [
          Text(
            chat.messages.last.text,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      trailing: Text(
        chat.messages.last.createdAt.toString(),
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}

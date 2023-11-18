import 'package:chat/presentation/chat/chat_dialog/chat_dialog_page.dart';
import 'package:chat/presentation/chat/widgets/custom_card.dart';
import 'package:chat/presentation/chat/widgets/select_contact.dart';
import 'package:flutter/material.dart';

class ChatOverviewPage extends StatefulWidget {
  const ChatOverviewPage({super.key});

  @override
  State<ChatOverviewPage> createState() => _ChatOverviewPageState();
}

class _ChatOverviewPageState extends State<ChatOverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SelectContact()));
        },
        child: Icon(Icons.chat),
      ),
      appBar: AppBar(
        title: Text('ChatAppX'),
        backgroundColor: Color(0xff222e3a),
        leading: Icon(Icons.search, ),
      ),
      //drawer: Drawer,
      backgroundColor: Color(0xff1b252f),
      body: ListView(
        children: [
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDialogPage(),));
              },
              child: CustomCard()),
          Divider(),
          CustomCard(),
          Divider(),
          CustomCard(),
          Divider(),
          CustomCard(),
          Divider(),
        ],
      ),
    );
  }
}

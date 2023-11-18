import 'package:chat/presentation/chat/widgets/custom_card.dart';
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
      appBar: AppBar(
        title: Text('ChatAppX'),
        backgroundColor: Colors.indigo.shade800,
        leading: Icon(Icons.search, ),
      ),
      //drawer: Drawer,
      backgroundColor: Colors.indigo.shade800,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.chat),
      ),
      body: ListView(
        children: [
          CustomCard(),
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

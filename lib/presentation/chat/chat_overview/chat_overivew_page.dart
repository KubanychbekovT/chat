import 'package:chat/presentation/chat/chat_dialog/chat_dialog_page.dart';
import 'package:chat/presentation/chat/widgets/custom_card.dart';
import 'package:chat/presentation/chat/widgets/select_contact.dart';
import 'package:chat/presentation/core/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class ChatOverviewPage extends StatefulWidget {
  const ChatOverviewPage({super.key});

  @override
  State<ChatOverviewPage> createState() => _ChatOverviewPageState();
}

class _ChatOverviewPageState extends State<ChatOverviewPage> {
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SelectContact()),
          );
        },
        child: Icon(Icons.chat),
      ),
      appBar: AppBar(
        title: _isSearching ? _buildSearchField() : Text('ChatAppX'),
        backgroundColor: Color(0xff222e3a),
        leading: _isSearching ? IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              _isSearching = false;
            });
          },
        ) : null,
        actions: [
          _isSearching ? SizedBox.shrink() : IconButton(
            onPressed: () {
              setState(() {
                _isSearching = true;
              });
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      backgroundColor: Color(0xff1b252f),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatDialogPage()),
              );
            },
            child: CustomCard(),
          ),
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

  Widget _buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(color: Colors.grey),
      ),
      onChanged: (value) {
      },
    );
  }
}

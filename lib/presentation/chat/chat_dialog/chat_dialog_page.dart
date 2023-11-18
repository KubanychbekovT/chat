import 'package:flutter/material.dart';

class ChatDialogPage extends StatefulWidget {
  const ChatDialogPage({super.key});

  @override
  State<ChatDialogPage> createState() => _ChatDialogPageState();
}

class _ChatDialogPageState extends State<ChatDialogPage> {
  TextEditingController _messageController = TextEditingController();
  List<String> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1b252f),
        appBar: AppBar(
          backgroundColor: Color(0xff222e3a),
          leadingWidth: 70,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back,
                  size: 24,
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blueGrey,
                )
              ],
            ),
          ),
          title: Column(
            children: [
              Text('Dev Stack',
                style: TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Last seen today at 12:05',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              )
            ],
          ),
        ),
        body: Container(

          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Stack(
              children: [
              ListView(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: Color(0xff212d3b),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              controller: _messageController,
                              decoration: InputDecoration(
                                prefixIcon: IconButton(
                                    icon: Icon(Icons.emoji_emotions),
                                onPressed: () {},),
                                border: InputBorder.none,
                                hintText: 'Message...',
                                hintStyle: TextStyle(color: Colors.white70),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send, color: Colors.white),
                        onPressed: () {
                          String message = _messageController.text;
                          _messages.add(message);
                          _messageController.clear();
                        },
                      ),
                    ],
                  ),
                ),
              ],
          ),
        ),
    );
  }
}

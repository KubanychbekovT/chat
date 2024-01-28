import 'package:chat/application/chat/message/message_cubit.dart';
import 'package:chat/domain/chat/chat/chat.dart';
import 'package:chat/presentation/chat/widgets/info_user.dart';
import 'package:chat/presentation/chat/widgets/message_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatDialogPage extends StatefulWidget {
  const ChatDialogPage({super.key, required this.chat});

  final Chat chat;

  @override
  State<ChatDialogPage> createState() => _ChatDialogPageState();
}

class _ChatDialogPageState extends State<ChatDialogPage> {
  TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MessageCubit()..init(widget.chat),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: const Color(0xff1b252f),
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: const Color(0xff222e3a),
            leadingWidth: 70,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Row(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const UserDetailPage(username: 'Dev Stack', bio: 'Flutter Engineer'),
                        ));
                  },
                  child: Text(
                    widget.chat.withUser!.name,
                    style:
                        TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const Text(
                  'Last seen recently',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                )
              ],
            ),
          ),
          body: BlocBuilder<MessageCubit, MessageState>(
            builder: (context, state) {
              if (state.chat == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return Column(
                children: [
                  Expanded(child: Builder(builder: (context) {
                    final messages = state.chat!.messages;
                    print("Number of messages: ${messages.length}");

                    if (messages.isEmpty) {
                      print("No messages");
                      return const Expanded(
                        child: Center(
                          child: Text(
                            'Нет сообщений',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      );
                    } else {
                      print("Messages found");
                      return ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          return MessageCard(message: messages[index]);
                        },
                      );
                    }
                  })),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Card(
                            color: const Color(0xff212d3b),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 1,
                                controller: _messageController,
                                decoration: InputDecoration(
                                  prefixIcon: IconButton(
                                    icon: const Icon(
                                      Icons.emoji_emotions,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Message...',
                                  hintStyle: const TextStyle(color: Colors.white70),
                                ),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send, color: Colors.white),
                          onPressed: () {
                            String messageText = _messageController.text;
                            if (messageText.isNotEmpty) {
                              context.read<MessageCubit>().sendMessage(messageText);
                              _messageController.clear();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

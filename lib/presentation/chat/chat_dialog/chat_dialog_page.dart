import 'package:chat/application/chat/message/message_cubit.dart';
import 'package:chat/domain/group/group.dart';
import 'package:chat/domain/message/message.dart';
import 'package:chat/domain/message/message_request.dart';
import 'package:chat/presentation/chat/widgets/chat_card.dart';
import 'package:chat/presentation/chat/widgets/info_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatDialogPage extends StatefulWidget {
  const ChatDialogPage({super.key});

  @override
  State<ChatDialogPage> createState() => _ChatDialogPageState();
}

class _ChatDialogPageState extends State<ChatDialogPage> {
  TextEditingController _messageController = TextEditingController();
  List<MessageRequest> _messages = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                        builder: (context) => const UserDetailPage(
                            username: 'Dev Stack', bio: 'Flutter Engineer'),
                      ));
                },
                child: const Text(
                  'Dev Stack',
                  style: TextStyle(
                      fontSize: 18.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const Text(
                'Last seen today at 12:05',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              )
            ],
          ),
        ),
        body: BlocBuilder<MessageCubit, MessageState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: state.when(
                    initial: () => const Center(child: Text('')),
                    loading: () => const Center(child: CircularProgressIndicator()),
                    loaded: (messages) {
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
                            return ChatCard(message: messages[index]);
                          },
                        );
                      }
                    },

                    error: (errorMessage) => Center(child: Text(errorMessage)),
                    groupCreated: (Group group) {
                      return const Center(
                        child: Text('Group Created'),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: const Color(0xff212d3b),
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
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
                                hintStyle:
                                const TextStyle(color: Colors.white70),
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
                            Message message = Message(
                                text: messageText, time: DateTime.now());
                            MessageRequest messageRequest = MessageRequest(
                              content: message.text,
                              createdAt: message.time.toString(),
                              fileDataIds: [],
                              isRead: false,
                              messageType: 'text',
                              recipient: 'recipient',
                              sender: 'sender',
                            );

                            context
                                .read<MessageCubit>()
                                .sendMessage(messageRequest);
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
    );
  }
}
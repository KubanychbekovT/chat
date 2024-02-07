import 'package:chat/application/chat/message/message_cubit.dart';
import 'package:chat/domain/chat/chat/chat.dart';
import 'package:chat/domain/chat/message/message.dart';
import 'package:chat/presentation/chat/widgets/user_details.dart';
import 'package:chat/presentation/chat/widgets/message_card.dart';
import 'package:chat/repository/user/user_repository.dart';
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
  Set<String> shownDateDividers = Set<String>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      MessageCubit()
        ..init(widget.chat),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
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
                          const UserDetailsPage(
                              username: 'Dev Stack', bio: 'Flutter Engineer'),
                        ));
                  },
                  child: Text(
                    widget.chat.withUser!.name,
                    style: const TextStyle(fontSize: 18.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
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

              final messages = state.chat!.messages.reversed.toList();

              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        final isMyMessage = message.sender == UserRepository
                            .currentUserId;

                        if (index > 0 &&
                            !_shouldShowDateDivider(
                                messages[index - 1].createdAt,
                                message.createdAt)) {
                          return Column(
                            children: [
                              if (!_isDateDividerAlreadyShown(
                                  message.createdAt))
                                _buildDateDivider(message.createdAt),
                              _buildMessage(isMyMessage, message),
                            ],
                          );
                        } else {
                          return _buildMessage(isMyMessage, message);
                        }
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0),
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
                                  hintStyle: const TextStyle(
                                      color: Colors.white70),
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
                              context.read<MessageCubit>().sendMessage(
                                  messageText);
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


  bool _shouldShowDateDivider(DateTime previousMessageTime,
      DateTime currentMessageTime) {
    return !DateTimeHelper.areSameDay(previousMessageTime, currentMessageTime);
  }

  bool _isDateDividerAlreadyShown(DateTime messageTime) {
    final formattedDate = DateTimeHelper.formatDate(messageTime);
    return shownDateDividers.contains(formattedDate);
  }

  void _markDateDividerAsShown(DateTime messageTime) {
    final formattedDate = DateTimeHelper.formatDate(messageTime);
    shownDateDividers.add(formattedDate);
  }

  Widget _buildDateDivider(DateTime messageTime) {
    _markDateDividerAsShown(messageTime);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      alignment: Alignment.center,
      child: Text(
        DateTimeHelper.formatDate(messageTime),
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildMessage(bool isMyMessage, Message message) {
    return Column(
      crossAxisAlignment: isMyMessage
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        if (!isMyMessage)
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              message.sender,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
            ),
          ),
        MessageCard(message: message),
      ],
    );
  }
}

class DateTimeHelper {
  static bool areSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }

  static String formatDate(DateTime date) {
    return '${date.day}.${date.month}.${date.year}';
  }
}

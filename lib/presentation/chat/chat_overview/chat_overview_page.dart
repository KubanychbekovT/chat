import 'package:chat/application/chat/chat/chat_watcher_cubit.dart';
import 'package:chat/presentation/chat/widgets/chat_card.dart';
import 'package:chat/presentation/chat/widgets/search.dart';
import 'package:chat/presentation/core/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatOverviewPage extends StatefulWidget {
  const ChatOverviewPage({super.key});

  @override
  State<ChatOverviewPage> createState() => _ChatOverviewPageState();
}

class _ChatOverviewPageState extends State<ChatOverviewPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatWatcherCubit()..init(),
      child: Scaffold(
          drawer: const CustomDrawer(),
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: const Color(0xff1b252f),
            title: const Text(
              'ChatAppX',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatSearcherPage(),
                      ));
                },
              ),
            ],
          ),
          backgroundColor: const Color(0xff1b252f),
          body: BlocBuilder<ChatWatcherCubit, ChatWatcherState>(
            builder: (context, state) {
              return state.maybeMap(
                loaded: (state) {
                  final chats = state.chats;
                  return ListView.builder(
                      itemCount: chats.length,
                      itemBuilder: (context, index) {
                        final chat = chats[index];
                        return Column(
                          children: [
                            ChatCard(
                              chat: chat,
                            ),
                          ],
                        );
                      });
                },
                loading: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
                orElse: () => const SizedBox(),
              );
            },
          )),
    );
  }
}

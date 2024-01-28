import 'package:chat/application/chat/chat/chat_watcher_cubit.dart';
import 'package:chat/presentation/chat/widgets/chat_card.dart';
import 'package:chat/presentation/chat/widgets/search_field.dart';
import 'package:chat/presentation/core/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatOverviewPage extends StatefulWidget {
  const ChatOverviewPage({super.key});

  @override
  State<ChatOverviewPage> createState() => _ChatOverviewPageState();
}

class _ChatOverviewPageState extends State<ChatOverviewPage> {
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatWatcherCubit()..init(),
      child: Scaffold(
          drawer: const CustomDrawer(),
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            title: _isSearching
                ? const SearchField()
                : const Text(
                    'ChatAppX',
                    style: TextStyle(color: Colors.white),
                  ),
            backgroundColor: const Color(0xff222e3a),
            leading: _isSearching
                ? IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      setState(() {
                        _isSearching = false;
                      });
                    },
                  )
                : null,
            actions: [
              _isSearching
                  ? const SizedBox.shrink()
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          _isSearching = true;
                        });
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
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

// class ChatOverviewPage extends StatelessWidget {
//   const ChatOverviewPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: CustomDrawer(),
//       appBar: AppBar(
//         title: Text('ChatAppX'),
//         backgroundColor: Color(0xff222e3a),
//       ),
//       backgroundColor: Color(0xff1b252f),
//       body: BlocBuilder<ChatCubit, ChatState>(
//         builder: (context, state) {
//           return state.when(
//             initial: () => _buildInitial(),
//             loading: () => _buildLoading(),
//             loaded: (chats) => _buildLoaded(chats),
//             error: (error) => _buildError(error),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildInitial() {
//     return Center(
//       child: CircularProgressIndicator(),
//     );
//   }
//
//   Widget _buildLoading() {
//     return Center(
//       child: CircularProgressIndicator(),
//     );
//   }
//
//   Widget _buildLoaded(List<ChatResponse> chats) {
//     return ListView.builder(
//       itemCount: chats.length,
//       itemBuilder: (context, index) {
//         final chat = chats[index];
//         return GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ChatDialogPage()),
//             );
//           },
//           child: CustomCard(),
//         );
//       },
//     );
//   }
//
//   Widget _buildError(String error) {
//     return Center(
//       child: Text('Error: $error'),
//     );
//   }
// }

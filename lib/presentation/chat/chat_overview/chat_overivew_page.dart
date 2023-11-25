import 'package:chat/presentation/chat/chat_dialog/chat_dialog_page.dart';
import 'package:chat/presentation/chat/widgets/custom_card.dart';
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
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Column(
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
              if (index != 5) Divider(),
            ],
          );
        })
    );
  }

  Widget _buildSearchField() {
    return TextField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Search',
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.grey),
      ),
      onChanged: (value) {
      },
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

// import 'package:chat/application/chat/chat_searcher/chat_searcher_cubit.dart';
// import 'package:chat/presentation/chat/more/group/group_overview_page.dart';
// import 'package:flutter/material.dart';
//
// class SearchField extends StatelessWidget {
//   final ChatSearcherCubit chatSearcherCubit;
//
//   const SearchField({Key? key, required this.chatSearcherCubit}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       style: const TextStyle(color: Colors.white),
//       decoration: const InputDecoration(
//         hintText: 'Search',
//         labelStyle: TextStyle(color: Colors.white),
//         hintStyle: TextStyle(color: Colors.white),
//       ),
//       onChanged: (value) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ChatSearcherPage(),
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatSearcherPage extends StatefulWidget {
  @override
  _ChatSearcherPageState createState() => _ChatSearcherPageState();
}

class _ChatSearcherPageState extends State<ChatSearcherPage> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xff1b252f),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color(0xff1b252f),
          title: Text('Search',
          style: TextStyle(color: Colors.white),),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                },
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: (query.isNotEmpty)
                    ? FirebaseFirestore.instance
                        .collection('users')
                        .where('name', isGreaterThanOrEqualTo: query)
                        .where('name', isLessThan: query + 'z')
                        .snapshots()
                    : FirebaseFirestore.instance.collection('users').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final List<QueryDocumentSnapshot> users = snapshot.data!.docs;
                  if (users.isEmpty) {
                    return Center(
                      child: Text('No users found.',style: TextStyle(color: Colors.white),),
                    );
                  }
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ListTile(
                        title: Text(user['name'], style: TextStyle(color: Colors.white),),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

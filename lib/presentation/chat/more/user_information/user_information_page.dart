import 'package:flutter/material.dart';

class UserInformationPage extends StatelessWidget {
  final String nickname;
  final String email;

  const UserInformationPage({super.key, required this.nickname, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b252f),
      appBar: AppBar(
        backgroundColor: const Color(0xff222e3a),
        title: const Text('Profile', style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    radius: 30,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  nickname,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Information',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    email,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
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

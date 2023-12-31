import 'package:flutter/material.dart';

class UserInformationPage extends StatelessWidget {
  final String nickname;
  final String email;

  const UserInformationPage({super.key, required this.nickname, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1b252f),
      appBar: AppBar(
        backgroundColor: Color(0xff222e3a),
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    radius: 30,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  nickname,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Information',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    email,
                    style: TextStyle(
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

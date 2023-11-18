import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.grey,
      ),
      title: Text('Dev Stack', style: TextStyle(fontSize: 16,  color: Colors.white
      ),
      ),
      subtitle: Row(
        children: [
          Text(
            'Flutter Engineer',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

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
            'Hi Dev Stack',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      trailing: Text('10:04', style: TextStyle(color: Colors.grey),),
    );
  }
}

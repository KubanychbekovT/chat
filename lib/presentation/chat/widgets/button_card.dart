import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person_add_alt_1, color: Color(0xff1b252f),),
        ),
        radius: 30,
        backgroundColor: Colors.grey,
      ),
      title: const Text('New Group', style: TextStyle(fontSize: 16,  color: Colors.white
      ),
      ),
    );
  }
}

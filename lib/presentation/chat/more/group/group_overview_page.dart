import 'package:flutter/material.dart';

class GroupOverviewPage extends StatelessWidget {
  const GroupOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color(0xff1b252f),
          title: const Text(
            'ChatAppX',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: const Color(0xff1b252f),
      ),
    );
  }
}

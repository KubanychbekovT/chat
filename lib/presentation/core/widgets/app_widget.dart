import 'package:chat/presentation/sign_in/sign_up_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatAppX',
      home: SignUpPage(),
    );
  }
}

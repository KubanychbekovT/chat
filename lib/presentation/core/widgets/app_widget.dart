import 'package:chat/application/auth/sign_in/sign_in_cubit.dart';
import 'package:chat/presentation/chat/chat_overview/chat_overivew_page.dart';
import 'package:chat/presentation/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatAppX',
      home: BlocProvider(
        create: (context) => SignInCubit(),
        child: SignInPage(),
      ),
    );
  }
}

import 'package:chat/application/auth/sign_in/sign_in_cubit.dart';
import 'package:chat/application/chat/message/message_cubit.dart';
import 'package:chat/presentation/core/main_page.dart';
import 'package:chat/presentation/sign_in/sign_in_page.dart';
import 'package:chat/repository/core/dio_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInCubit(),
        ),
        BlocProvider(
          create: (context) => MessageCubit(dio),
        ),
      ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainPage(),
          title: 'ChatAppX',
        ),
    );
  }
}

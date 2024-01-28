import 'package:chat/application/auth/sign_in/sign_in_cubit.dart';
import 'package:chat/managers/chat_manager.dart';
import 'package:chat/presentation/core/main_page.dart';
import 'package:chat/presentation/sign_in/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashy_flushbar/flashy_flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with WidgetsBindingObserver {
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      chatsManager.checkBackgroundQueue();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    final isSignedIn = FirebaseAuth.instance.currentUser != null;
    return FlashyFlushbarProvider(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignInCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: isSignedIn ? const MainPage() : SignInPage(),
          title: 'ChatAppX',
        ),
      ),
    );
  }
}

import 'package:chat/application/auth/sign_in/sign_in_cubit.dart';
import 'package:chat/application/auth/sign_up/sign_up_cubit.dart';
import 'package:chat/managers/chat_manager.dart';
import 'package:chat/presentation/core/main_page.dart';
import 'package:chat/presentation/sign_in/sign_in_page.dart';
import 'package:chat/repository/auth/auth_firebase_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashy_flushbar/flashy_flushbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatefulWidget {
  final AuthFirebaseRepository authRepository;

  const AppWidget({required this.authRepository, Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with WidgetsBindingObserver {
  @override
  void initState() {
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

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignInCubit(),),
        BlocProvider(create: (context) => SignUpCubit(AuthFirebaseRepository()),),
      ],
      child: MaterialApp(
        theme: ThemeData(backgroundColor: const Color(0xff1b252f)),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        home: isSignedIn ? const MainPage() : SignInPage(),
        title: 'ChatAppX',
        builder: FlashyFlushbarProvider.init(),
      ),
    );
  }
}
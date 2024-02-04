import 'package:chat/application/auth/sign_in/sign_in_cubit.dart';
import 'package:chat/application/auth/sign_up/sign_up_cubit.dart';
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
  Widget build(BuildContext context) {
    final isSignedIn = FirebaseAuth.instance.currentUser != null;
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      home: FlashyFlushbarProvider(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SignInCubit(),
            ),
            BlocProvider(
              create: (context) => SignUpCubit(AuthFirebaseRepository()),
            ),
          ],
          child: isSignedIn ? const MainPage() : SignInPage(),
        ),
      ),
      title: 'ChatAppX',
    );
  }
}


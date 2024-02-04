import 'package:chat/firebase_options.dart';
import 'package:chat/presentation/core/widgets/app_widget.dart';
import 'package:chat/repository/get_it/get_it_initializer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'repository/auth/auth_firebase_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await getItSetUp();

  AuthFirebaseRepository authRepository = AuthFirebaseRepository();

  runApp(AppWidget(authRepository: authRepository));
}

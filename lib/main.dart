import 'package:chat/firebase_options.dart';
import 'package:chat/presentation/core/widgets/app_widget.dart';
import 'package:chat/repository/get_it/get_it_initializer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await getItSetUp();
  runApp(const AppWidget());
}

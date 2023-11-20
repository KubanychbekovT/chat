import 'package:chat/presentation/core/widgets/app_widget.dart';
import 'package:chat/repository/get_it/get_it_initializer.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getItSetUp();
  runApp(AppWidget());
}

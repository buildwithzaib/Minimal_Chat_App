// ignore_for_file: unused_import

import 'package:chat_app/Pages/loginpage.dart';
import 'package:chat_app/Pages/register_page.dart';
import 'package:chat_app/auth/login_or_reguster.dart';
import 'package:chat_app/theme/light_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
      theme: lightMode,
    );
  }
}

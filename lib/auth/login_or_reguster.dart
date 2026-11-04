import 'package:chat_app/Pages/loginpage.dart';
import 'package:chat_app/Pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // initialize login page
  bool showLoginPage = true;

  // toggle between login and register page

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Loginpage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}

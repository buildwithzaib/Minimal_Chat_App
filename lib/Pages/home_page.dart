import 'package:chat_app/auth/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const new({super.key});

  void logout() {
    //get auth service
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          //logout button
          IconButton(onPressed: logout, icon: Icon(Icons.logout)),
        ],
      ),
    );
  }
}

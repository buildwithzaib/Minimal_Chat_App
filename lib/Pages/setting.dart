import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Center(child: Text("Setting Screen")),
      ),
    );
  }
}

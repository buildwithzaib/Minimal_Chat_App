import 'package:chat_app/components/my_textfield.dart';
import 'package:chat_app/components/mybutton.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  // email and password controller
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  // tap on go to register page
  final void Function()? onTap;

  Loginpage({super.key, required this.onTap});

  // login method
  void login() {
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo design
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            SizedBox(height: 30),
            // Welcome back msg
            Text(
              "Welcome back, you've been missed",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            SizedBox(height: 30),

            // text fields
            MyTextfield(
              hintText: "Email",
              obsecureText: false,
              controller: emailcontroller,
            ),
            SizedBox(height: 20),
            MyTextfield(
              hintText: "Password",
              obsecureText: true,
              controller: passwordcontroller,
            ),

            SizedBox(height: 30),

            // log in button
            Mybutton(text: "LogIn", onTap: login),

            SizedBox(height: 20),

            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register Here",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,

                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

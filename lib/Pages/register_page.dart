import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:chat_app/components/mybutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();

  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  // register page method
  void register(BuildContext context) async {
    // get auth service
    final authService = AuthService();

    // if the password match then create user.
    if (passwordcontroller.text == confirmpasswordcontroller.text) {
      try {
        await authService.signUpWithEmailPassword(
          emailcontroller.text.trim(),
          passwordcontroller.text,
        );
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Account created successfully.")),
        );
      } catch (e) {
        if (!context.mounted) return;
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Registration failed"),
            content: Text(_registrationErrorMessage(e)),
          ),
        );
      }
    }
    // password dont match then we show an error
    else {
      showDialog(
        context: context,
        builder: (context) =>
            const AlertDialog(title: Text("Password dont match")),
      );
    }
  }

  String _registrationErrorMessage(Object error) {
    if (error is! FirebaseAuthException) return error.toString();

    return switch (error.code) {
      'operation-not-allowed' =>
        'Email/password sign-up is disabled. Enable it in Firebase Console under Authentication > Sign-in method.',
      'email-already-in-use' => 'An account already exists for this email.',
      'invalid-email' => 'Enter a valid email address.',
      'weak-password' => 'Choose a stronger password (at least 6 characters).',
      'network-request-failed' =>
        'Could not connect to Firebase. Check your internet connection and try again.',
      'too-many-requests' =>
        'Too many attempts. Please wait a while and try again.',
      _ => 'Firebase error (${error.code}): ${error.message ?? 'Please try again.'}',
    };
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
              "Let's Create an account for you",
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

            SizedBox(height: 20),
            MyTextfield(
              hintText: "Confirm Password",
              obsecureText: true,
              controller: confirmpasswordcontroller,
            ),

            SizedBox(height: 30),

            // log in button
            Mybutton(text: "Register", onTap: () => register(context)),

            SizedBox(height: 20),

            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
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

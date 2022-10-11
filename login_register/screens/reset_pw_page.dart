// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  static const String id = 'reset_pw_page';
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                content: Text(
                    'Link sent! Please check your email to reset your password'));
          });
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[500],
        elevation: 5,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Enter your email to reset your password'),
          SizedBox(height: 15),
          //email
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Email',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          SizedBox(height: 15),
          //reset button
          ElevatedButton(
            onPressed: passwordReset,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Reset Password',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 15),
          //to login page button
          OutlinedButton.icon(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.pink,
            ),
            label: const Text('Login page'),
            style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ))),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

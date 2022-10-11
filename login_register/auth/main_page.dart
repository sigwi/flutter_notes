import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:muria/screens/login_page.dart';
import '../screens/home_page.dart';

class MainPage extends StatelessWidget {
  static const String id = 'main_page';
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}

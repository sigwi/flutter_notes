import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:mangga/screens/map_screen.dart';

class PageHandler extends StatelessWidget {
  static const String id = 'page_handler';
  const PageHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MapScreen();
          } else {
            return MapScreen();
          }
        },
      ),
    );
  }
}

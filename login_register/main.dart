import 'package:flutter/material.dart';
import 'package:muria/auth/main_page.dart';
import 'package:muria/screens/home_page.dart';
import 'package:muria/screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:muria/screens/profile_page.dart';
import 'package:muria/screens/register_page.dart';
import 'package:muria/screens/reset_pw_page.dart';
import 'firebase_options.dart';
import 'package:muria/screens/search_page.dart';
import 'package:muria/screens/chat_page.dart';
import 'package:muria/screens/profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MainPage.id,
      routes: {
        MainPage.id: (context) => MainPage(),
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        HomePage.id: (context) => HomePage(),
        ResetPasswordPage.id: (context) => ResetPasswordPage(),
        SearchPage.id: (context) => SearchPage(),
        ChatPage.id: (context) => ChatPage(),
        ProfilePage.id: (context) => ProfilePage(),
      },
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:muria/auth/main_page.dart';

class ProfilePage extends StatefulWidget {
  static const String id = 'profile_page';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //log out method
  Future logOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, MainPage.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[500],
        elevation: 5,
        title: Text('User'),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text('logout'),
        onPressed: logOut,
      )),
    );
  }
}

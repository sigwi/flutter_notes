import 'package:flutter/material.dart';
import 'package:muria/auth/main_page.dart';

import 'package:muria/components/input_texts.dart';

class ChatPage extends StatefulWidget {
  static const String id = 'chat_page';
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _inputText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[500],
        elevation: 5,
        title: Text('Contact'),
        leading: InkWell(
          onTap: () => Navigator.pushNamed(context, MainPage.id),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('ok'),
            ],
          ),
        ),
      ),
    );
  }
}

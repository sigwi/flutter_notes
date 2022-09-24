import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text('Magic 8 Balls'),
        ),
        body: const MyBalls(),
      ),
    ),
  );
}

class MyBalls extends StatefulWidget {
  const MyBalls({super.key});

  @override
  State<MyBalls> createState() => _MyBallsState();
}

class _MyBallsState extends State<MyBalls> {
  var answer = ['Yes', 'No', 'Go for it', 'Nice', 'Sike'];

  int changeNumber = 0;

  void onPresF() => setState(() {
        changeNumber = Random().nextInt(4);
      });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.indigo,
            textStyle: const TextStyle(fontSize: 40),
          ),
          onPressed: onPresF,
          child: Text(answer[changeNumber]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(250, 211, 193, 253),
        appBar: AppBar(
          title: const Text('Xylophone'),
          backgroundColor: Colors.red,
        ),
        body: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final player = AudioPlayer();

  void audioP(int soundNumber) {
    player.play(DeviceFileSource('assets/note$soundNumber.wav'));
  }

  Expanded tingButton({required int number, required Color color}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {
          audioP(number);
        },
        child: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          tingButton(number: 1, color: Colors.red),
          tingButton(number: 2, color: Colors.lightGreenAccent),
          tingButton(number: 3, color: Colors.green),
          tingButton(number: 4, color: Colors.purple),
          tingButton(number: 5, color: Colors.indigo),
          tingButton(number: 6, color: Colors.blueGrey),
          tingButton(number: 7, color: Colors.lightBlueAccent),
        ],
      ),
    );
  }
}

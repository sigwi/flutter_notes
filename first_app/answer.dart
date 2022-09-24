import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final dynamic selectHandler;

  const Answer(this.selectHandler, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: selectHandler,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle:
                const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        child: const Text('answer 1'),
      ),
    );
  }
}

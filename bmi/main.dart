import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color.fromARGB(255, 255, 0, 0),
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 2, 10),
      ),
      home: InputPage(),
    );
  }
}

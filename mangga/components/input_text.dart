import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  InputForm(
      {required this.controller, required this.text, required this.hideText});

  final TextEditingController controller;
  final String text;
  final bool hideText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller: controller,
        obscureText: hideText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: text,
          hintStyle: TextStyle(color: Colors.grey),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}

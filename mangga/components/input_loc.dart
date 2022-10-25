import 'package:flutter/material.dart';

class InputLoc extends StatelessWidget {
  InputLoc({
    super.key,
    required this.controller,
    required this.text,
    required this.focusNode,
    required this.suffixIcon,
    required this.onChanged,
  });

  late TextEditingController controller = TextEditingController();
  late String text;
  late FocusNode focusNode;
  Widget? suffixIcon;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          TextField(
            focusNode: focusNode,
            controller: controller,
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
              //menampilkan tanda silang di ujung kanan
              suffixIcon: suffixIcon,
            ),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OutlinedIconButton extends StatelessWidget {
  OutlinedIconButton({
    required this.label,
    required this.ikon,
    required this.onPress,
  });

  final String label;
  final IconData ikon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      label: Text(label),
      icon: Icon(
        ikon,
        color: Colors.grey,
      ),
      style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(15),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(15),
          ))),
      onPressed: onPress,
    );
  }
}

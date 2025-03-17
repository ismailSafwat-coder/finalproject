import 'package:flutter/material.dart';

class Custombuttom1 extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const Custombuttom1({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: const Color(0xFF5F8CF8),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 14),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

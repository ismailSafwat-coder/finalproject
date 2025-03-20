import 'package:flutter/material.dart';

class Freetimetextform extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  const Freetimetextform({super.key, this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextFormField(
        readOnly: true,
        controller: controller,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 22,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 199, 191, 191), width: 1),
              borderRadius: BorderRadius.circular(30),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFebebeb)),
                borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Sleeptextform extends StatelessWidget {
  TextEditingController? controller;
  final String hintText;
  Sleeptextform({super.key, this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: SizedBox(
        height: 35,
        child: TextFormField(
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
                    color: Color.fromARGB(255, 199, 191, 191), width: 1.5),
                borderRadius: BorderRadius.circular(30),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFebebeb)),
                  borderRadius: BorderRadius.circular(30))),
        ),
      ),
    );
  }
}

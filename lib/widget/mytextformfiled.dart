import 'package:flutter/material.dart';

class Mytextformfiled extends StatelessWidget {
  final String? Function(String?)? validator;
  final String? hintText;

  const Mytextformfiled({
    super.key,
    required this.validator,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 199, 191, 191), width: 2.5),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFebebeb)),
              borderRadius: BorderRadius.circular(10))),
    );
  }
}

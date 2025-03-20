// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Mytextformfiled extends StatelessWidget {
  TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;

  Mytextformfiled({
    super.key,
    this.controller,
    required this.validator,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
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

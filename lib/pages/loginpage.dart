import 'package:enhud/widget/form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background image filling the screen
          Positioned.fill(
            child: Image.asset(
              'images/2.png',

              fit: BoxFit.cover, // Ensures the image covers the entire screen
            ),
          ),

          // Centered content (your form, button, etc.)
          const Center(
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, // Ensures the column takes up only necessary space
              children: [
                // Optional title or other widgets

                SizedBox(height: 140),

                // Your custom form (or any other widget)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomForm(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

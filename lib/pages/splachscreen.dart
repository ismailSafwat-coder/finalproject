import 'package:enhud/pages/loginpage.dart';
import 'package:flutter/material.dart';
// Ensure this path is correct

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to the signup screen after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFFFFFFF), // Same as the native splash color
      body: Center(
        child: Image.asset(
          "images/photo_2025-02-03_13-46-00.jpg",
          height: 500,
          width: 500,
        ), // Second, larger image
      ),
    );
  }
}

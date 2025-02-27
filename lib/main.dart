import 'package:enhud/pages/forgetpassword1.dart';
import 'package:enhud/pages/forgetpassword2.dart';
import 'package:enhud/pages/splachscreen.dart';
import 'package:flutter/material.dart';
import 'pages/forgetpassword3.dart';
import 'pages/signup_page.dart';
import 'pages/signupscreen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const SplashScreen(), // Show the splash screen first
    );
  }
}

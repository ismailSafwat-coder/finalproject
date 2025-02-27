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

const TextStyle midTextStyle = TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);
const TextStyle commonTextStyle = TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: commonTextStyle,
          bodyMedium: commonTextStyle,
          bodySmall: commonTextStyle,
        ),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const SplashScreen(), // Show the splash screen first
    );
  }
}

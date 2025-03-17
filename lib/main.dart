import 'package:enhud/pages/splachscreen.dart';
import 'package:enhud/widget/alertdialog/studytabeldialog.dart';

import 'package:flutter/material.dart';

import 'pages/text.dart';

void main() {
  runApp(const MyApp());
}

const TextStyle midTextStyle = TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);
const TextStyle commonTextStyle = TextStyle(
  fontSize: 22,
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
          bodyMedium: midTextStyle,
          bodySmall: commonTextStyle,
        ),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const StudyTimetable(), // Show the splash screen first
    );
  }
}

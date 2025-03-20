import 'package:enhud/firebase_options.dart';
import 'package:enhud/pages/loginpage.dart';
import 'package:enhud/pages/noti.dart';
import 'package:enhud/pages/notifications/notifications.dart';
import 'package:enhud/pages/splachscreen.dart';
import 'package:enhud/pages/test.dart';
import 'package:enhud/widget/alertdialog/studytabeldialog.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'pages/text.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //init notifications
  Notifications().initNotification();
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
        // textTheme: const TextTheme(
        //   bodyLarge: commonTextStyle,
        //   bodyMedium: midTextStyle,
        //   bodySmall: commonTextStyle,
        // ),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

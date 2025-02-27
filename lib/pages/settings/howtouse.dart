import 'package:flutter/material.dart';

class Howtouse extends StatelessWidget {
  const Howtouse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "How to Use",
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
        child: ListView(
          children: const [
            Text(
              'Welcome to the App',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            PrivacyText(
              text:
                  "First, you need to register in the app to create your account. The app is available for both students and teachers. If you're a student, create a student account, and if you're a teacher, create a teacher account.",
            ),
            PrivacyText(
              text:
                  "Once registered, you will be directed to the main page. The main page displays your appointments and reminders, all organized for easy use. You have the ability to add, edit, and delete appointments, as well as view your weekly schedule.",
            ),
            PrivacyText(
              text:
                  "The app also features AI support to generate exams for students. Finally, in the settings, you will find your account information, app version, usage instructions, notifications and reminders, the privacy policy, the option to provide feedback, and the ability to log out.",
            ),
          ],
        ),
      ),
    );
  }
}

class PrivacyText extends StatelessWidget {
  final String text;

  const PrivacyText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 18, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}

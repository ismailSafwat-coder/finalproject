import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Privacy Policy",
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
        child: ListView(
          children: const [
            PrivacyText(
              number: "1.",
              text:
                  "We don’t collect any of your personal data, as we have no servers to store it. So even if people in black came and asked nicely to see your data, we wouldn’t have anything to show them.",
            ),
            PrivacyText(
              number: "2.",
              text:
                  "There are no in-app tricky analytical plugins, and Application doesn’t need Internet connection to work properly. Literally, we don’t have any access to your cookies, other apps, e-mail, and any other things used for fishing. It’s just no fun!",
            ),
            PrivacyText(
              number: "3.",
              text:
                  "Paying for subscriptions, you are interacting with Google Billing API, according to its privacy policy; we personally have no access to your credit card number, name or address.",
            ),
            PrivacyText(
              number: "4.",
              text:
                  "Actually, all that we do have is the info provided by Google Developer Console and its built-in analytics, that is some general data like the app’s page traffic and users’ demography. And we don’t tell it to any interested 'third parties', as they have no interest in it.",
            ),
          ],
        ),
      ),
    );
  }
}

class PrivacyText extends StatelessWidget {
  final String number;
  final String text;

  const PrivacyText({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
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

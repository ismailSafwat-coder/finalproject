import 'package:enhud/auth/authservices.dart';
import 'package:enhud/pages/homescreen.dart';
import 'package:enhud/pages/loginpage.dart';
import 'package:enhud/pages/settings/accountinfo_page.dart';
import 'package:enhud/pages/settings/feedback.dart';
import 'package:enhud/pages/settings/howtouse.dart';
import 'package:enhud/pages/settings/notification.dart';
import 'package:enhud/pages/settings/privacypolicy.dart';
import 'package:enhud/pages/settings/version_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AccountinfoPage()));
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color(0xFFf0f0f0),
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                SvgPicture.asset(
                  'images/account.svg',
                  height: 35,
                  width: 35,
                ),
                const Text(
                  '  Account Info',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const NotificationSettingsPage()));
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color(0xFFf0f0f0),
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                SvgPicture.asset(
                  'images/notification.svg',
                  height: 35,
                  width: 35,
                ),
                const Text(
                  '  Notification & Reminder',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const VersionPage()));
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color(0xFFf0f0f0),
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                InkWell(
                  child: SvgPicture.asset(
                    'images/version.svg',
                    height: 35,
                    width: 35,
                  ),
                ),
                const Text(
                  '  Version',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const PrivacyPolicy()));
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color(0xFFf0f0f0),
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                SvgPicture.asset(
                  'images/privacy.svg',
                  height: 35,
                  width: 35,
                ),
                const Text(
                  '  Privacy Policy',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Howtouse()));
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color(0xFFf0f0f0),
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                SvgPicture.asset(
                  'images/use.svg',
                  height: 35,
                  width: 35,
                ),
                const Text(
                  '  How to Use',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const FeedbackPage()));
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color(0xFFf0f0f0),
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                SvgPicture.asset(
                  'images/feedback.svg',
                  height: 35,
                  width: 35,
                ),
                const Text(
                  '  Feedback',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Authservices().singout();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
              (route) => false,
            );
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color(0xFFf0f0f0),
                ),
                borderRadius: BorderRadius.circular(10)),
            child: const Row(
              children: [
                Icon(
                  Icons.logout_outlined,
                  size: 35,
                ),
                Text(
                  '  Logo Out',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

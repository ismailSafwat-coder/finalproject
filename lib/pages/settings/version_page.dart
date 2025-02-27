import 'package:enhud/pages/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VersionPage extends StatefulWidget {
  const VersionPage({super.key});

  @override
  State<VersionPage> createState() => _VersionPageState();
}

class _VersionPageState extends State<VersionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Version'),
      ),
      backgroundColor: Colors.white,
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Application Details:',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
            Text(
              'The application was          installed was from Google    play .',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text(
                  'Version : ',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Text(
                  '1.01.01',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: bottmbar(context),
    );
  }

  Container bottmbar(BuildContext context) {
    return Container(
      height: 60,
      color: const Color(0xFFd9d9d9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const HomeScreen(
                            homeindex: 0,
                          )),
                  (route) => false,
                );
              },
              child: SvgPicture.asset('images/Home.svg')),
          InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const HomeScreen(
                            homeindex: 1,
                          )),
                  (route) => false,
                );
              },
              child: SvgPicture.asset('images/Timetable.svg')),
          InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const HomeScreen(
                            homeindex: 2,
                          )),
                  (route) => false,
                );
              },
              child: SvgPicture.asset('images/Add.svg')),
          InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const HomeScreen(
                            homeindex: 3,
                          )),
                  (route) => false,
                );
              },
              child: SvgPicture.asset('images/Exam.svg')),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset('images/Settings.svg'),
              Container(
                padding: const EdgeInsets.all(0),
                width: 9,
                height: 9,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF5f8cf8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

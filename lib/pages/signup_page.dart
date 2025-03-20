import 'package:enhud/main.dart';
import 'package:enhud/pages/signupscreen2.dart';
import 'package:flutter/material.dart';
import 'package:enhud/widget/alertdialog/authdialog.dart';

class SignupScreen1 extends StatefulWidget {
  const SignupScreen1({super.key});

  @override
  State<SignupScreen1> createState() => _SignupScreen1State();
}

class _SignupScreen1State extends State<SignupScreen1> {
  String type = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'images/1.png',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  const Text(
                    'Choose Role :',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: [
                      const Text(
                        'Teacher',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          type = 'Teacher';
                          setState(() {});
                        },
                        child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: type == 'Teacher'
                                    ? const Color(0xFF90CAF9)
                                    : const Color(0xFFf8f8f8),
                                border: Border.all(
                                    color: type == 'Teacher'
                                        ? const Color(0xFF90CAF9)
                                        : const Color(0xFFf8f8f8),
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(5)),
                            child: Image.asset('images/teacher.png')),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Student',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          type = 'Student';
                          setState(() {});
                        },
                        child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: type == 'Student'
                                    ? const Color(0xFF90CAF9)
                                    : const Color(0xFFf8f8f8),
                                border: Border.all(
                                    color: type == 'Student'
                                        ? const Color(0xFF90CAF9)
                                        : const Color(0xFFf8f8f8),
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(5)),
                            child: Image.asset('images/student.png')),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 44,
                          width: 105,
                          // padding: const EdgeInsets.symmetric(
                          //     horizontal: 18, vertical: 11),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color(0xFF5F8CF8), width: 2),
                          ),
                          child: const Center(
                              child: Text(
                            textAlign: TextAlign.center,
                            'Back',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF5b86ed)),
                          )),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (type == '') {
                            showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                content: Text(
                                  'you are student or teacher',
                                  style: midTextStyle,
                                ),
                              ),
                            );
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Signupscreen2()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: const Color(0xFF5F8CF8),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 38, vertical: 14),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

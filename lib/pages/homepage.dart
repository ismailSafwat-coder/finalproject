import 'package:enhud/pages/notificationscreen.dart';
import 'package:enhud/pages/settings/notification.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../main.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //first row with user image
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFebebeb))),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //image
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          'images/accountimage.png',
                        ),
                      ),
                      const Spacer(),
                      //first icon
                      Image.asset('images/message.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      //secound icon
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationsScreen()));
                          },
                          child: Image.asset(
                              'images/notificationvbellactive.png')),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                //today schedule
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFF7d7d7d))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //text
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Today Schedule :',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      ),
                      //listview card
                      const SizedBox(
                        height: 15,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            card(),
                            card(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //material studing
                const SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.all(15),
                        width: 350,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //text
                            const Text(
                              // textAlign: TextAlign.end,
                              ' Materials  Studying :',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            ),
                            //row of like math
                            const Divider(
                              height: 20,
                            ),
                            materilsfile('English unit', 0.8),
                            const Divider(
                              height: 20,
                            ),
                            materilsfile('physics unit', 0.4),
                            const Divider(
                              height: 20,
                            ),
                            materilsfile('math unit', 0.7)
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        width: 350,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //text
                            const Text(
                              // textAlign: TextAlign.end,
                              ' Materials  Studying :',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            ),
                            //row of like math
                            const Divider(
                              height: 20,
                            ),
                            testfile('English unit', 0.8, false),
                            const Divider(
                              height: 20,
                            ),
                            testfile('Physics unit', 0.4, false),
                            const Divider(
                              height: 20,
                            ),
                            testfile('Maths | unit', 0.7, true)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //motivation message
                const SizedBox(
                  height: 15,
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MotivationalMessages())
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox card() {
    return SizedBox(
        height: 210,
        width: 350,
        child: Card(
          margin: const EdgeInsets.all(8),
          color: const Color(0xFF5f8cf8),
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //fist row
                Row(
                  children: [
                    const Text(
                      'Up Coming',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    Row(
                      children: [
                        Image.asset('images/timer.png'),
                        const Text(
                          ' 0hrs 30mins',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    )
                  ],
                ),
                //secound row
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    //image
                    Image.asset(
                      'images/teacherpic.png',
                      fit: BoxFit.fill,
                      height: 90,
                      width: 70,
                    ),
                    //column teacher and material
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Teacher : Mr.Mohamed Shaban',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'material : physics',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
                //text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      fit: BoxFit.fill,
                      'images/clock1.png',
                      width: 20,
                      height: 20,
                    ),
                    const Text(
                      '  8:00am, 23 oct, Sat',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Row materilsfile(String name, double? percent) {
    return Row(children: [
      Image.asset(
        'images/paper.png',
        fit: BoxFit.contain,
        width: 35,
        height: 30,
      ),
      Text(
        name,
        style: midTextStyle,
      ),
      const Spacer(),
      percent != null
          ? CircularPercentIndicator(
              animation: true,
              radius: 25,
              percent: percent,
              lineWidth: 5,
              progressColor: Colors.green,
              // circularStrokeCap: CircularStrokeCap.round,

              center: Text(
                (percent * 100).toStringAsFixed(0),
                style: midTextStyle,
              ),
            )
          : const Text('_')
    ]);
  }
}

Row testfile(String name, double? percent, bool finish) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Row(
      children: [
        Image.asset(
          'images/paper.png',
          fit: BoxFit.contain,
          width: 35,
          height: 30,
        ),
      ],
    ),
    Text(
      name,
      style: midTextStyle,
    ),
    percent != null
        ? CircularPercentIndicator(
            animation: true,

            radius: 25,
            percent: percent,
            lineWidth: 5,
            progressColor: Colors.green,
            // circularStrokeCap: CircularStrokeCap.round,

            center: Text(
              (percent * 100).toStringAsFixed(0),
              style: midTextStyle,
            ),
          )
        : const Text(
            '-',
            style: midTextStyle,
          ),
    MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // إصلاح الشكل
        ),
        color: finish ? Colors.blue : const Color(0xFF58d67e),
        child: finish ? const Text('Results') : const Text('Strart'),
        onPressed: () {})
  ]);
}

class MotivationalMessages extends StatelessWidget {
  final List<String> messages = [
    "“Be like a star that never stops shining even in the darkest nights.”",
    "“Despite the difficulties you may face, always remember that every success begins with one decision to start.”",
    "“Self-confidence is the most powerful weapon in facing challenges and achieving goals.”",
    "“Success is the accumulationof small efforts day after day, so do not underestimate any small effort you have made.”",
    "“There is no dream that cannot be achieved if you are willing to work hard to achieve it.”",
    "“Work smart and hard, and you will reap the rewards in due time.”",
    "“Embrace failure as part of the learning journey, and use it to develop yourself and your abilities.”",
    "“The greater the desire for success, the stronger the efforts and the better the results.”",
    "“Excellence is not only achieved by natural abilities, but also by hard work and dedication to continuous improvement.”",
    "“Change starts from within, so start by improving yourself before you try to change the world.”",
  ];

  MotivationalMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: messages.map((msg) {
          return Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.all(16),
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: Color(0xFFafcdf8),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                msg,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

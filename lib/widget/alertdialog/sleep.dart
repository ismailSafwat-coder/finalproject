import 'package:enhud/main.dart';
import 'package:enhud/widget/sleeptextform.dart';
import 'package:enhud/widget/studytabletextform.dart';
import 'package:flutter/material.dart';

class Sleep extends StatelessWidget {
  const Sleep({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: const Color(0xFFdedede))),
            child: Image.asset(
              'images/sleep.png',
              width: 150,
              height: 150,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: 300,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: MediaQuery.sizeOf(context).height * 0.4,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFdedede))),
            child: Column(
              children: [
                const Text(
                  'Enter Your Available Time',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Sleep Time',
                      style: commonTextStyle,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Sleeptextform(hintText: 'Default')
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Sleep Time',
                      style: commonTextStyle,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Sleeptextform(hintText: 'Default')
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Sleep Time',
                      style: commonTextStyle,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Sleeptextform(hintText: 'Default')
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Remind Before Time',
                      style: commonTextStyle,
                    ),
                    Sleeptextform(hintText: 'Default')
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

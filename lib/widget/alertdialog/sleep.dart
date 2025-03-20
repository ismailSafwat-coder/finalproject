import 'package:enhud/main.dart';
import 'package:enhud/widget/alertdialog/dropdownbuttoms.dart';
import 'package:enhud/widget/sleeptextform.dart';
import 'package:enhud/widget/studytabletextform.dart';
import 'package:flutter/material.dart';

class Sleep extends StatefulWidget {
  const Sleep({super.key});

  @override
  State<Sleep> createState() => _SleepState();
}

class _SleepState extends State<Sleep> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
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
            margin: const EdgeInsets.only(left: 5),
            height: MediaQuery.sizeOf(context).height * 0.32,
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
                      style: TextStyle(fontSize: 18),
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
                      'Wake-Up Time',
                      style: TextStyle(fontSize: 18),
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Snooze Duration',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    MyDropdownbuttoms()
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Remind Before Time',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    MyDropdownbuttoms()
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

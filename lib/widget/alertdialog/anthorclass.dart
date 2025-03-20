import 'package:enhud/main.dart';
import 'package:enhud/widget/freetimetextform.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Anthorclass extends StatefulWidget {
  final TextEditingController taskController;
  final TextEditingController Descriptioncontroller;
  const Anthorclass(
      {super.key,
      required this.taskController,
      required this.Descriptioncontroller});

  @override
  State<Anthorclass> createState() => _AnthorclassState();
}

class _AnthorclassState extends State<Anthorclass> {
  TimeOfDay? startTime;

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    startTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final format = DateFormat.jm(); // تنسيق 12 ساعة مع AM/PM
    return format.format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 4, right: 4),
      height: MediaQuery.sizeOf(context).height * 0.55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //text
          const Center(
            child: Text(
              'Enter Your Class Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //class name
          const Text(
            'Class Name',
            style: midTextStyle,
          ),
          Freetimetextform(
            hintText: 'Enter Your Class Name',
            controller: widget.taskController,
          ),
          //class discription
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Class Description',
            style: midTextStyle,
          ),
          IntrinsicHeight(
            child: SizedBox(
              child: TextFormField(
                maxLines: 3,
                controller: widget.Descriptioncontroller,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '\n Describe Your Class',
                    hintStyle: const TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 22,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 199, 191, 191), width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFebebeb)),
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
          ),

          //class time
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Class Time (Optional)',
            style: commonTextStyle,
          ),
          GestureDetector(
            onTap: () {
              _selectTime(context, true);
            },
            child: Container(
              width: double.infinity,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xffebebeb)),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                startTime != null
                    ? formatTimeOfDay(
                        startTime!) // تحويل الوقت إلى تنسيق 12 ساعة
                    : 'E.g., Monday 10 AM',
              ),
            ),
          ),
          //calss materials
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Class Materials (Optional)',
            style: midTextStyle,
          ),
          Freetimetextform(
            hintText: 'List Materials Needed',
            controller: widget.taskController,
          ),
        ],
      ),
    );
  }
}

import 'package:enhud/main.dart';
import 'package:enhud/widget/freetimetextform.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // استيراد intl package

class Freetime extends StatefulWidget {
  const Freetime({super.key});

  @override
  State<Freetime> createState() => _FreetimeState();
}

class _FreetimeState extends State<Freetime> {
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  DateTime? selectedDate; // متغير لتخزين التاريخ المحدد

  // دالة لتحويل TimeOfDay إلى تنسيق 12 ساعة
  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final format = DateFormat.jm(); // تنسيق 12 ساعة مع AM/PM
    return format.format(dt);
  }

  // دالة لفتح DatePicker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // التاريخ الافتراضي هو اليوم
      firstDate: DateTime(2000), // أول تاريخ يمكن اختياره
      lastDate: DateTime(2101), // آخر تاريخ يمكن اختياره
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked; // تحديث التاريخ المحدد
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        if (isStartTime) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.55,
        child: Column(
          children: [
            //image
            Image.asset('images/Clock.png'),
            //container text
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffd0d3f5),
              ),
              child: const Column(
                children: [
                  Text(
                    'Plan Your Free Time',
                    style: commonTextStyle,
                  ),
                  Text(
                    'Manage your spare time effectively with leisure activities or relaxation',
                    style: midTextStyle,
                  )
                ],
              ),
            ),

            //column time
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //main text
                  const Center(
                    child: Text(
                      'Enter Your Available Time',
                      style: commonTextStyle,
                    ),
                  ),
                  //column date
                  const Text('Date'),
                  GestureDetector(
                    onTap: () {
                      _selectDate(context); // فتح DatePicker
                    },
                    child: IntrinsicHeight(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffebebeb)),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          selectedDate != null
                              ? DateFormat('dd-MM-yyyy')
                                  .format(selectedDate!) // عرض التاريخ المحدد
                              : 'DD-MM-YYYY',
                        ),
                      ),
                    ),
                  ),
                  //column Start time
                  const Text('Start Time'),
                  GestureDetector(
                    onTap: () {
                      _selectTime(context, true);
                    },
                    child: IntrinsicHeight(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffebebeb)),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          startTime != null
                              ? formatTimeOfDay(
                                  startTime!) // تحويل الوقت إلى تنسيق 12 ساعة
                              : '08:00 AM',
                        ),
                      ),
                    ),
                  ),
                  //column End time
                  const Text('End Time'),
                  GestureDetector(
                    onTap: () {
                      _selectTime(context, false);
                    },
                    child: IntrinsicHeight(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffebebeb)),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          endTime != null
                              ? formatTimeOfDay(
                                  endTime!) // تحويل الوقت إلى تنسيق 12 ساعة
                              : '10:00 PM',
                        ),
                      ),
                    ),
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

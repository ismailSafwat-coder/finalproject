import 'package:enhud/main.dart';
import 'package:enhud/widget/studytabletextform.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExamDialog extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController taskController;
  final TextEditingController Descriptioncontroller;

  final String type;
  const ExamDialog(
      {super.key,
      required this.formKey,
      required this.taskController,
      required this.Descriptioncontroller,
      required this.type});

  @override
  State<ExamDialog> createState() => _ExamDialogState();
}

class _ExamDialogState extends State<ExamDialog> {
  TimeOfDay? startTime;
  DateTime? selectedDate;

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

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final format = DateFormat.jm(); // تنسيق 12 ساعة مع AM/PM
    return format.format(dt);
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    startTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Form(
        key: widget.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.type} Details',
              style: commonTextStyle,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text('${widget.type} name'),
                const SizedBox(
                  width: 10,
                ),
                Studytabletextform(
                    controller: widget.taskController,
                    hintText: 'Enter ${widget.type} name')
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _selectDate(context); // فتح DatePicker
                  },
                  child: IntrinsicWidth(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
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
                GestureDetector(
                  onTap: () {
                    _selectTime(context, true);
                  },
                  child: IntrinsicWidth(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
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
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Notes',
              style: commonTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: '\n  Add Notes',
                  hintStyle: const TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 199, 191, 191), width: 2.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFebebeb)),
                      borderRadius: BorderRadius.circular(10))),
            )
          ],
        ),
      ),
    );
  }
}

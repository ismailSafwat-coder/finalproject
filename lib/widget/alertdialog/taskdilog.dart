import 'package:enhud/widget/studytabletextform.dart';
import 'package:flutter/material.dart';

class Taskdilog extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String type;
  final String? priority;
  final TextEditingController taskController;
  final TextEditingController Descriptioncontroller;
  final Function(String?) onPriorityChanged;
  const Taskdilog(
      {super.key,
      required this.priority,
      required this.formKey,
      required this.taskController,
      required this.Descriptioncontroller,
      required this.onPriorityChanged,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('$type Title'),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                    child: Studytabletextform(
                        controller: taskController,
                        hintText: 'Enter $type Title')),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('Description'),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                    child: Studytabletextform(
                        controller: Descriptioncontroller,
                        hintText: 'Enter Description')),
              ],
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            const Text('Priority'),
            Row(
              children: [
                Radio<String>(
                  value: 'Low',
                  groupValue: priority,
                  onChanged: (value) {
                    onPriorityChanged;
                  },
                ),
                const Text('Low'),
                Radio<String>(
                  value: 'Medium',
                  groupValue: priority,
                  onChanged: (value) {
                    onPriorityChanged;
                  },
                ),
                const Text('Medium'),
                Radio<String>(
                  value: 'High',
                  groupValue: priority,
                  onChanged: (value) {
                    onPriorityChanged;
                  },
                ),
                const Text('High'),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

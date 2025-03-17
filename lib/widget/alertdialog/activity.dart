import 'package:enhud/widget/studytabletextform.dart';
import 'package:flutter/material.dart';

class ActivityDialog extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController taskController;
  final TextEditingController Descriptioncontroller;

  final String type;
  const ActivityDialog(
      {super.key,
      required this.formKey,
      required this.taskController,
      required this.Descriptioncontroller,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                SizedBox(
                  height: 35,
                  child: Flexible(
                      child: Studytabletextform(
                          controller: taskController,
                          hintText: 'Enter $type Title')),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('Description'),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 35,
                  child: Flexible(
                      child: Studytabletextform(
                          controller: Descriptioncontroller,
                          hintText: 'Enter Description')),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('Attach Matterials'),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                    width: 80,
                    child: Studytabletextform(
                        controller: taskController, hintText: 'upload')),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

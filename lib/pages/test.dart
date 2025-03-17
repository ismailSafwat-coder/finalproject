import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskFormScreen(),
    );
  }
}

class TaskFormScreen extends StatefulWidget {
  const TaskFormScreen({super.key});

  @override
  _TaskFormScreenState createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _priority;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Task Title'),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter Task Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Description'),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter Task Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              const Text('Due Date'),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'DD-MM-YYYY',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 10),
              const Text('Priority'),
              Row(
                children: [
                  Radio<String>(
                    value: 'Low',
                    groupValue: _priority,
                    onChanged: (value) {
                      setState(() => _priority = value);
                    },
                  ),
                  const Text('Low'),
                  Radio<String>(
                    value: 'Medium',
                    groupValue: _priority,
                    onChanged: (value) {
                      setState(() => _priority = value);
                    },
                  ),
                  const Text('Medium'),
                  Radio<String>(
                    value: 'High',
                    groupValue: _priority,
                    onChanged: (value) {
                      setState(() => _priority = value);
                    },
                  ),
                  const Text('High'),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Task Added')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Add Task',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

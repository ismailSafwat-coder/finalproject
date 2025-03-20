import 'package:flutter/material.dart';

class MyDropdownbuttoms extends StatefulWidget {
  const MyDropdownbuttoms({super.key});

  @override
  State<MyDropdownbuttoms> createState() => _MyDropdownbuttomsState();
}

class _MyDropdownbuttomsState extends State<MyDropdownbuttoms> {
  int? selectedNumber;

  final List<int> numbers = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 70,
      child: DropdownButton<int>(
        value: selectedNumber,
        hint: const Text(
          'Select',
          textAlign: TextAlign.center,
        ),
        onChanged: (int? newValue) {
          setState(() {
            selectedNumber = newValue;
          });
        },
        items: numbers.map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text('$value'),
          );
        }).toList(),
      ),
    );
  }
}

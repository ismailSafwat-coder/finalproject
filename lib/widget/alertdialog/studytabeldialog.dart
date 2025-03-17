import 'package:enhud/widget/mytextformfiled.dart';
import 'package:flutter/material.dart';

class StudyTimetabletest extends StatefulWidget {
  const StudyTimetabletest({super.key});

  @override
  State<StudyTimetabletest> createState() => _StudyTimetabletestState();
}

class _StudyTimetabletestState extends State<StudyTimetabletest> {
  final _formKey = GlobalKey<FormState>();
  String? _priority;
  List<List<Widget>> cellContent = [];
  List<String> timeSlots = [
    '08:00 am - 09:00 am',
    '09:00 am - 10:00 am',
    '10:00 am - 11:00 am',
  ];

  final List<String> categories = [
    "Material",
    "Task",
    "Assignment",
    "Exam",
    "Activity",
    "Another Class"
  ];

  @override
  void initState() {
    super.initState();
    _initializeCellContent();
  }

  void _initializeCellContent() {
    cellContent =
        List.generate(timeSlots.length, (_) => List.filled(8, const Text('')));
  }

  Future<void> _addNewTimeSlot() async {
    final TimeOfDay? startTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (startTime == null) return;

    final TimeOfDay? endTime = await showTimePicker(
      context: context,
      initialTime: startTime,
    );

    if (endTime == null) return;

    final String newTimeSlot =
        '${startTime.format(context)} - ${endTime.format(context)}';

    setState(() {
      timeSlots.add(newTimeSlot);
      cellContent.add(List.filled(8, const Text('')));
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double widget = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Study Timetable'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: const Color(0xffE4E4E4),
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: TableBorder.all(color: Colors.white, width: 2),
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(1),
                      3: FlexColumnWidth(1),
                      4: FlexColumnWidth(1),
                      5: FlexColumnWidth(1),
                      6: FlexColumnWidth(1),
                      7: FlexColumnWidth(1),
                    },
                    children: [
                      _buildTableHeader(),
                      for (int i = 0; i < timeSlots.length; i++)
                        _buildTableRow(timeSlots[i], rowIndex: i),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: _addNewTimeSlot,
                  child: Container(
                    height: 50,
                    width: widget * 0.25,
                    color: Colors.blue[100],
                    child: const Center(
                      child: Icon(Icons.add_circle, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      children: [
        _buildTableCell('Day / Time', isHeader: true),
        _buildTableCell('Sat', isHeader: true, addpadding: true),
        _buildTableCell('Sun', isHeader: true, addpadding: true),
        _buildTableCell('Mon', isHeader: true, addpadding: true),
        _buildTableCell('Tue', isHeader: true, addpadding: true),
        _buildTableCell('Wed', isHeader: true, addpadding: true),
        _buildTableCell('Thu', isHeader: true, addpadding: true),
        _buildTableCell('Fri', isHeader: true, addpadding: true),
      ],
    );
  }

  TableRow _buildTableRow(String time, {required int rowIndex}) {
    return TableRow(
      children: [
        _buildTableCell(time, isrowheder: true),
        for (int colIndex = 1; colIndex < 8; colIndex++)
          _buildTableCellWithGesture(rowIndex, colIndex),
      ],
    );
  }

  Widget _buildTableCell(String text,
      {bool isHeader = false,
      bool isrowheder = false,
      bool addpadding = false}) {
    return Container(
      padding: addpadding
          ? const EdgeInsets.symmetric(vertical: 20)
          : const EdgeInsets.symmetric(vertical: 20.0),
      color:
          isHeader || isrowheder ? Colors.blue[100] : const Color(0xffE4E4E4),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildTableCellWithGesture(int rowIndex, int colIndex) {
    return GestureDetector(
      onTap: () {
        _showAddItemDialog(rowIndex, colIndex);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        color: const Color(0xffE4E4E4),
        child: Center(
          child: cellContent[rowIndex][colIndex],
        ),
      ),
    );
  }

  void _showAddItemDialog(int rowIndex, int colIndex) {
    String? selectedCategory;
    TextEditingController taskController = TextEditingController();
    TextEditingController materialController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          backgroundColor: const Color(0xfff8f7f7),
          contentPadding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Color(0xffc6c6c6)),
          ),
          content: SizedBox(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back),
                      Text('Select Category'),
                      SizedBox(width: 20),
                    ],
                  ),
                ),
                const Divider(color: Color(0xffc6c6c6)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Category', style: TextStyle(fontSize: 16)),
                    const SizedBox(width: 10),
                    DropdownButton<String>(
                      hint: const Text('Select'),
                      value: selectedCategory,
                      icon: const Icon(Icons.arrow_drop_down),
                      onChanged: (String? newValue) {
                        setDialogState(() {
                          selectedCategory = newValue;
                        });
                      },
                      items: categories
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Dynamic fields based on category
                if (selectedCategory == 'Task') ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text('Task Title'),
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      fillColor: Colors.blue,
                                      hintText: 'Enter Task Title',
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 199, 191, 191),
                                            width: 2.5),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xFFebebeb)),
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                            ],
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
                ] else if (selectedCategory == 'Material') ...[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: materialController,
                      decoration: const InputDecoration(
                        labelText: 'Material Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (selectedCategory == 'Task' &&
                          taskController.text.isNotEmpty) {
                        cellContent[rowIndex][colIndex] =
                            Text(taskController.text);
                      } else if (selectedCategory == 'Material' &&
                          materialController.text.isNotEmpty) {
                        cellContent[rowIndex][colIndex] =
                            Text(materialController.text);
                      }
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

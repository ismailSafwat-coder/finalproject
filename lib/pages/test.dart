import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

// نموذج المهمة (Task)
class TaskModel {
  String title;
  String description;
  String dueDate;
  String priority;

  TaskModel({
    required this.title,
    required this.description,
    required this.dueDate,
    required this.priority,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'dueDate': dueDate,
      'priority': priority,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'],
      description: map['description'],
      dueDate: map['dueDate'],
      priority: map['priority'],
    );
  }
}

// نموذج المادة (Material)
class MaterialModel {
  String materialName;
  String teacherName;
  String studyAppointment;

  MaterialModel({
    required this.materialName,
    required this.teacherName,
    required this.studyAppointment,
  });

  Map<String, dynamic> toMap() {
    return {
      'materialName': materialName,
      'teacherName': teacherName,
      'studyAppointment': studyAppointment,
    };
  }

  factory MaterialModel.fromMap(Map<String, dynamic> map) {
    return MaterialModel(
      materialName: map['materialName'],
      teacherName: map['teacherName'],
      studyAppointment: map['studyAppointment'],
    );
  }
}

// نموذج الواجب (Assignment)
class AssignmentModel {
  String assignmentTitle;
  String description;
  String dueDate;
  String attachMaterials;

  AssignmentModel({
    required this.assignmentTitle,
    required this.description,
    required this.dueDate,
    required this.attachMaterials,
  });

  Map<String, dynamic> toMap() {
    return {
      'assignmentTitle': assignmentTitle,
      'description': description,
      'dueDate': dueDate,
      'attachMaterials': attachMaterials,
    };
  }

  factory AssignmentModel.fromMap(Map<String, dynamic> map) {
    return AssignmentModel(
      assignmentTitle: map['assignmentTitle'],
      description: map['description'],
      dueDate: map['dueDate'],
      attachMaterials: map['attachMaterials'],
    );
  }
}

// نموذج الامتحان (Exam)
class ExamModel {
  String examDetails;
  String date;
  String notes;

  ExamModel({
    required this.examDetails,
    required this.date,
    required this.notes,
  });

  Map<String, dynamic> toMap() {
    return {
      'examDetails': examDetails,
      'date': date,
      'notes': notes,
    };
  }

  factory ExamModel.fromMap(Map<String, dynamic> map) {
    return ExamModel(
      examDetails: map['examDetails'],
      date: map['date'],
      notes: map['notes'],
    );
  }
}

// نوع العنصر (ItemType)
enum ItemType { Task, Material, Assignment, Exam }

// النموذج العام (BaseModel)
class BaseModel {
  ItemType type;
  dynamic data;

  BaseModel({
    required this.type,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type.index,
      'data': data.toMap(),
    };
  }

  factory BaseModel.fromMap(Map<String, dynamic> map) {
    ItemType type = ItemType.values[map['type']];
    dynamic data;

    switch (type) {
      case ItemType.Task:
        data = TaskModel.fromMap(map['data']);
        break;
      case ItemType.Material:
        data = MaterialModel.fromMap(map['data']);
        break;
      case ItemType.Assignment:
        data = AssignmentModel.fromMap(map['data']);
        break;
      case ItemType.Exam:
        data = ExamModel.fromMap(map['data']);
        break;
    }

    return BaseModel(type: type, data: data);
  }
}

// واجهة المستخدم (UI)
class StudyTimetableNew extends StatefulWidget {
  const StudyTimetableNew({super.key});

  @override
  State<StudyTimetableNew> createState() => _StudyTimetableNewState();
}

class _StudyTimetableNewState extends State<StudyTimetableNew> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late double height;
  late double width;
  List<List<BaseModel>> cellContent = [];
  List<String> timeSlots = [
    '08:00 am - 09:00 am',
    '09:00 am - 10:00 am',
    '10:00 am - 11:00 am',
  ];

  @override
  void initState() {
    super.initState();
    _initializeCellContent();
    _loadData(); // تحميل البيانات المحفوظة
  }

  void _initializeCellContent() {
    cellContent = List.generate(
      timeSlots.length,
      (_) => List.generate(
          8,
          (_) => BaseModel(
              type: ItemType.Task,
              data: TaskModel(
                  title: '', description: '', dueDate: '', priority: ''))),
    );
  }

  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedData = [];

    for (var row in cellContent) {
      for (var cell in row) {
        savedData.add(jsonEncode(cell.toMap()));
      }
    }

    await prefs.setStringList('cellContent', savedData);
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedData = prefs.getStringList('cellContent');

    if (savedData != null) {
      int index = 0;
      for (int i = 0; i < timeSlots.length; i++) {
        for (int j = 0; j < 8; j++) {
          cellContent[i][j] = BaseModel.fromMap(jsonDecode(savedData[index]));
          index++;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.sizeOf(context).height;
    width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    width: width * 0.25,
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
      height: height * 0.12,
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
        color: const Color(0xffE4E4E4),
        child: Center(
          child: _buildCellContent(cellContent[rowIndex][colIndex]),
        ),
      ),
    );
  }

  Widget _buildCellContent(BaseModel cell) {
    switch (cell.type) {
      case ItemType.Task:
        TaskModel task = cell.data;
        return Column(
          children: [
            Text(task.title),
            Text(task.description),
            Text(task.dueDate),
            Text(task.priority),
          ],
        );
      case ItemType.Material:
        MaterialModel material = cell.data;
        return Column(
          children: [
            Text(material.materialName),
            Text(material.teacherName),
            Text(material.studyAppointment),
          ],
        );
      case ItemType.Assignment:
        AssignmentModel assignment = cell.data;
        return Column(
          children: [
            Text(assignment.assignmentTitle),
            Text(assignment.description),
            Text(assignment.dueDate),
            Text(assignment.attachMaterials),
          ],
        );
      case ItemType.Exam:
        ExamModel exam = cell.data;
        return Column(
          children: [
            Text(exam.examDetails),
            Text(exam.date),
            Text(exam.notes),
          ],
        );
    }
  }

  void _showAddItemDialog(int rowIndex, int colIndex) {
    ItemType selectedType = ItemType.Task;
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController dueDateController = TextEditingController();
    TextEditingController priorityController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('إضافة عنصر'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButton<ItemType>(
              value: selectedType,
              onChanged: (ItemType? newValue) {
                setState(() {
                  selectedType = newValue!;
                });
              },
              items: ItemType.values.map((ItemType type) {
                return DropdownMenuItem<ItemType>(
                  value: type,
                  child: Text(type.toString().split('.').last),
                );
              }).toList(),
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'العنوان'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'الوصف'),
            ),
            TextField(
              controller: dueDateController,
              decoration: const InputDecoration(labelText: 'تاريخ الاستحقاق'),
            ),
            TextField(
              controller: priorityController,
              decoration: const InputDecoration(labelText: 'الأولوية'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                switch (selectedType) {
                  case ItemType.Task:
                    cellContent[rowIndex][colIndex] = BaseModel(
                      type: ItemType.Task,
                      data: TaskModel(
                        title: titleController.text,
                        description: descriptionController.text,
                        dueDate: dueDateController.text,
                        priority: priorityController.text,
                      ),
                    );
                    break;
                  case ItemType.Material:
                    // إضافة بيانات المادة
                    break;
                  case ItemType.Assignment:
                    // إضافة بيانات الواجب
                    break;
                  case ItemType.Exam:
                    // إضافة بيانات الامتحان
                    break;
                }
              });
              _saveData(); // حفظ البيانات
              Navigator.pop(context);
            },
            child: const Text('حفظ'),
          ),
        ],
      ),
    );
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
      cellContent.add(List.generate(
          8,
          (_) => BaseModel(
              type: ItemType.Task,
              data: TaskModel(
                  title: '', description: '', dueDate: '', priority: ''))));
    });
  }
}

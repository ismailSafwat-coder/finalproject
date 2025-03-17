import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  static final List<NotificationItem> notifications = [
    NotificationItem(
      title: "Arabic Lesson",
      category: "Material",
      time: "11:45 AM",
      message: "You should go now so you won’t be late",
      color: Colors.blue[400]!,
    ),
    NotificationItem(
      title: "Math Task",
      category: "High Prio",
      time: "02:30 PM",
      message:
          "You should solve the set of problems the teacher has requested in the last lesson now.",
      color: Colors.orange[300]!,
    ),
    NotificationItem(
      title: "Gym",
      category: "Activity",
      time: "08:00 PM",
      message: "You should go to gym now, Don’t be lazy to keep your fit.",
      color: Colors.yellow[600]!,
    ),
    NotificationItem(
      title: "Physics Exam",
      category: "Exam",
      time: "09:30 PM",
      message:
          "You have an exam in physics tomorrow, You should start studying and revising well from now.",
      color: Colors.red[400]!,
    ),
    NotificationItem(
      title: "OOP Project",
      category: "Assignment",
      time: "11:00 PM",
      message:
          "You should start in the project now to be able to meet the deadline.",
      color: Colors.orange[400]!,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.notifications, color: Colors.black),
            SizedBox(width: 8),
            Text("Notifications", style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationCard(notification: notifications[index]);
        },
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String category;
  final String time;
  final String message;
  final Color color;

  const NotificationItem({
    required this.title,
    required this.category,
    required this.time,
    required this.message,
    required this.color,
  });
}

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: notification.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text("• ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(
                notification.title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text("  •  "),
              Text(notification.category, style: const TextStyle(fontSize: 14)),
              const Spacer(),
              const Icon(Icons.access_time, size: 16),
              const SizedBox(width: 4),
              Text(notification.time, style: const TextStyle(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            notification.message,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text("Done",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 10),
              TextButton(
                onPressed: () {},
                child: const Text("Snooze",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

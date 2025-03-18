import 'package:enhud/pages/notifications/notifications.dart';
import 'package:flutter/material.dart';

class Noti extends StatelessWidget {
  const Noti({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Notifications()
                      .showNotification(title: 'Titile', body: 'body');
                },
                child: const Text('show notification')),
          )
        ],
      ),
    );
  }
}

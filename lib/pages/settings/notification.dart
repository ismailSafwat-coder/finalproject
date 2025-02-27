import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool showNotifications = true;
  bool lockScreenNotifications = true;
  bool allowSound = true;
  bool allowVibration = false;
  bool allowLEDLight = false;
  bool allowUpdates = true;
  bool dismissManually = true;
  bool showDoneAction = true;
  bool fullScreenNotification = false;

  Widget buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 16)),
              Row(
                children: [
                  Text(
                    value ? "On" : "Off",
                    style: TextStyle(
                      color: value ? Colors.blue : Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CupertinoSwitch(
                    value: value,
                    onChanged: (newValue) =>
                        setState(() => onChanged(newValue)),
                    activeColor: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notification",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 10),

            // Main Notifications Header
            const Text(
              "Main Notifications",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),

            buildSwitchTile("Show Notifications", showNotifications,
                (value) => showNotifications = value),
            buildSwitchTile(
                "Lock screen Notifications",
                lockScreenNotifications,
                (value) => lockScreenNotifications = value),
            buildSwitchTile(
                "Allow Sound", allowSound, (value) => allowSound = value),
            buildSwitchTile("Allow Vibration", allowVibration,
                (value) => allowVibration = value),
            buildSwitchTile("Allow using LED Light", allowLEDLight,
                (value) => allowLEDLight = value),
            buildSwitchTile(
                "Allow Updates", allowUpdates, (value) => allowUpdates = value),

            const SizedBox(height: 10),

            // Reminders Header
            const Text(
              "Reminders",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),

            buildSwitchTile("Dismiss manually", dismissManually,
                (value) => dismissManually = value),
            buildSwitchTile("Show ‘Done’ action", showDoneAction,
                (value) => showDoneAction = value),
            buildSwitchTile("Full screen notification", fullScreenNotification,
                (value) => fullScreenNotification = value),

            // Sound setting with a clickable button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Sound", style: TextStyle(fontSize: 16)),
                  GestureDetector(
                    onTap: () {
                      // Implement sound selection
                    },
                    child: const Text(
                      "Default",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

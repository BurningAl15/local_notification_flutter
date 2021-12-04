import 'package:flutter/material.dart';
import 'local_notify_manager.dart';

class TestNotifyScreen extends StatefulWidget {
  const TestNotifyScreen({Key? key}) : super(key: key);

  @override
  _TestNotifyScreenState createState() => _TestNotifyScreenState();
}

class _TestNotifyScreenState extends State<TestNotifyScreen> {
  @override
  void initState() {
    super.initState();
    localNotifyManager.setOnNotificationReceive(onNotificationReceive);
    localNotifyManager.setOnNotificationClick(onNotificationClick);
  }

  onNotificationReceive(ReceiveNotification notification) {
    print('Notification Received: ${notification.id}');
  }

  onNotificationClick(String payload) {
    print('Payload $payload');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Notifications'),
      ),
      body: Center(
        child: TextButton(
          child: Text('Send Notification'),
          onPressed: () async {
            await localNotifyManager.showNotification();
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: rabbit,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios,
            color: white,
          ),
        ),
        title: const Text('Notification'),
      ),
      body: const Center(
        child: Icon(Icons.notifications_off,
          size: 64,
          color: silver,
        ),
      ),
    );
  }
}

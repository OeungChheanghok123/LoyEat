import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/icon_widget.dart';

class NotificationPageWidget extends StatefulWidget {
  const NotificationPageWidget({Key? key}) : super(key: key);

  @override
  _NotificationPageWidgetState createState() => _NotificationPageWidgetState();
}

class _NotificationPageWidgetState extends State<NotificationPageWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: IconWidget(
        icon: Icons.notifications_off,
        size: 100,
        color: silver,
      ),
    );
  }
}

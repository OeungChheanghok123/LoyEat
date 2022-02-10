import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/icon_widget.dart';
import 'package:loy_eat/widgets/layout_widget/title_appbar_widget.dart';
import 'package:loy_eat/widgets/page_widget/notification_page_widget.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String titleText = 'Notification';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: white,
        appBar: _buildAppBar(),
        body: const NotificationPageWidget(),
      ),
    );
  }

  AppBar _buildAppBar(){
    return AppBar(
      backgroundColor: rabbit,
      elevation: 0,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: const IconWidget(
          icon: Icons.arrow_back_ios,
          color: white,
          size: 24,
        ),
      ),
      titleSpacing: 0,
      title: TitleAppBarWidget(
        text: titleText,
        color: white,
      ),
    );
  }
}

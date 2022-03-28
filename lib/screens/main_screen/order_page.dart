import 'package:flutter/material.dart';
import 'package:loy_eat/screens/other_screen/home_screen/notification_page.dart';
import 'package:loy_eat/screens/other_screen/order_screen/order_empty.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/icon_widget.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';
import 'package:loy_eat/widgets/layout_widget/title_appbar_widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  bool isToggleClick = false;
  int notificationCounter = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: white,
        appBar: _buildAppBar(),
        body: const OrderEmpty(),
      ),
    );
  }

  AppBar _buildAppBar(){
    return AppBar(
      backgroundColor: isToggleClick ? rabbit : carrot,
      elevation: 0,
      leading: InkWell(
        splashColor: none,
        onTap: () => setState(() => isToggleClick = !isToggleClick ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: IconWidget(
            icon: isToggleClick ? Icons.toggle_on : Icons.toggle_off,
            size: 40,
            color: white,
          ),
        ),
      ),
      titleSpacing: 10,
      title: TitleAppBarWidget(
        text: isToggleClick ? 'Online' : 'Offline',
        color: white,
      ),
      actions: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: [
            InkWell(
              splashColor: none,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationPage())),
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                child: const IconWidget(
                  icon: Icons.notifications,
                  size: 35,
                  color: white,
                ),
              ),
            ),
            notificationCounter > 0 ? Positioned(
              top: 15,
              right: 15,
              child: Container(
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: isToggleClick ? carrot : rabbit,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextWidget(
                  text: notificationCounter.toString(),
                  color: white,
                  size: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ) : Container(),
          ],
        ),
      ],
    );
  }
}

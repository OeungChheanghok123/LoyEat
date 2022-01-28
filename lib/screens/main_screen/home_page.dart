import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/screens/other_screen/home_screen/notification_page.dart';
import 'package:loy_eat/widgets/page_widget/home_page_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isToggleClick = false;
  int notificationCounter = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: white,
        appBar: _buildAppBar(
            isToggleClick ? rabbit : carrot,
            isToggleClick ? Icons.toggle_on : Icons.toggle_off,
            isToggleClick ? 'Online' : 'Offline',
            isToggleClick ? carrot : rabbit,
            Icons.notifications,
        ),
        body: const HomePageWidget(),
      ),
    );
  }

  AppBar _buildAppBar(Color backgroundColor, IconData leadingIcon, String text, Color counterColor, IconData iconButton){
    return  AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: InkWell(
        splashColor: Colors.transparent,
        onTap: (){
          setState(() {
            isToggleClick = !isToggleClick;
          });
        },
        child: Icon(leadingIcon,
          size: 45,
        ),
      ),
      titleSpacing: 0,
      title: Text(text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: white,
        ),
      ),
      actions: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: IconButton(
                icon: Icon(iconButton,
                  size: 35,
                ),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationPage())),
              ),
            ),
            notificationCounter > 0 ? Positioned(
              top: 18,
              right: 15,
              child: Container(
                decoration: BoxDecoration(
                  color: counterColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(2.0),
                child:  Text('$notificationCounter',
                  style: const TextStyle(
                    color: white,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ) : Container(),
          ],
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/screens/flash_screen/start_up_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loy Eat driver delivery app',
      theme: ThemeData(
        primaryColor: rabbit
      ),
      home: const StartUpPage(),
    );
  }
}
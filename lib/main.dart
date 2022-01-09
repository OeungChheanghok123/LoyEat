import 'package:flutter/material.dart';
import 'package:loy_eat/page/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loy Eat driver delivery app',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: const InstructionPage(),
    );
  }
}
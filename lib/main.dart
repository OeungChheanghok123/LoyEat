import 'package:flutter/material.dart';
import 'package:loy_eat/page/instruction_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loy Eat driver delivery app',
      home: InstructionPage(),
    );
  }
}
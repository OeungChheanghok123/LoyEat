import 'package:flutter/material.dart';
import 'package:loy_eat/controller/color.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Icon(Icons.home,
            size: 64,
            color: rabbit,
          )
        ),
      ),
    );
  }
}
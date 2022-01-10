import 'package:flutter/material.dart';
import 'package:loy_eat/controller/color.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Icon(Icons.person,
            size: 64,
            color: rabbit,
          )
        ),
      ),
    );
  }
}

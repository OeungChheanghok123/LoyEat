import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Icon(Icons.access_time,
            size: 64,
            color: rabbit,
          )
        ),
      ),
    );
  }
}

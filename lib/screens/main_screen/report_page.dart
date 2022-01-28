import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Icon(Icons.account_balance_wallet,
            size: 64,
            color: rabbit,
          )
        ),
      ),
    );
  }
}

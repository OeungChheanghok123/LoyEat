import 'package:flutter/material.dart';
import 'package:loy_eat/controller/color.dart';
import 'package:loy_eat/widget/account_page_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: white,
        body: AccountPageWidget(),
      ),
    );
  }
}

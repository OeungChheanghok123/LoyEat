import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/page_widget/verify_phone_number_page_widget.dart';

class VerifyPhoneNumberPage extends StatelessWidget {
  const VerifyPhoneNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      backgroundColor: white,
      appBar: null,
      body: VerifyPhoneNumberPageWidget(),
    );
  }
}

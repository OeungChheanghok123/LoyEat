import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/page_widget/enter_otp_code_page_widget.dart';

class EnterOTPCodePage extends StatelessWidget {
  const EnterOTPCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      backgroundColor: white,
      appBar: null,
      body: EnterOTPCodePageWidget(),
    );
  }
}

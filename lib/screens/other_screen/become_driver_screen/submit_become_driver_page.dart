import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/page_widget/submit_become_driver_page_widget.dart';

class SubmitBecomeDriverPage extends StatelessWidget {
  const SubmitBecomeDriverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      backgroundColor: white,
      appBar: null,
      body: SubmitBecomeDriverPageWidget(),
    );
  }
}
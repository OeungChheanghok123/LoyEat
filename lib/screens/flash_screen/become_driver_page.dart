import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/page_widget/become_driver_page_widget.dart';

class BecomeDriver extends StatelessWidget {
  const BecomeDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      backgroundColor: white,
      appBar: null,
      body: BecomeDriverPageWidget(),
    );
  }
}
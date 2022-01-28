import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/page_widget/become_driver_widget.dart';

class BecomeDriver extends StatefulWidget {
  const BecomeDriver({Key? key}) : super(key: key);

  @override
  _BecomeDriverState createState() => _BecomeDriverState();
}

class _BecomeDriverState extends State<BecomeDriver> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: white,
        body: BecomeDriverWidget(),
      ),
    );
  }
}

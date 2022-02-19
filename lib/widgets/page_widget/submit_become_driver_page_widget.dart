import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loy_eat/screens/flash_screen/instruction_page.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/icon_widget.dart';
import 'package:loy_eat/widgets/layout_widget/space.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';

class SubmitBecomeDriverPageWidget extends StatefulWidget {
  const SubmitBecomeDriverPageWidget({Key? key}) : super(key: key);

  @override
  _SubmitBecomeDriverPageWidgetState createState() => _SubmitBecomeDriverPageWidgetState();
}

class _SubmitBecomeDriverPageWidgetState extends State<SubmitBecomeDriverPageWidget> {
  late Timer _timer;
  int _start = 5;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InstructionPage()));
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 5, 15, 15),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLayout(1, Container()),
            _buildLayout(3, _buildBody),
          ],
        ),
      ),
    );
  }

  Widget get _buildBody{
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: rabbit,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Center(
              child: IconWidget(
                icon: Icons.check,
                color: white,
                size: 48,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: const TextWidget(
              isTitle: true,
              text: 'Thank you',
            ),
          ),
          const TextWidget(text: 'You are now submitted!',),
          const Space(height: 50),
          const SizedBox(
            width: 250,
            child: TextWidget(
              textAlign: TextAlign.center,
              text: 'You have successfully submitted a request to be our driver partner. you will be contacted your team very soon.',
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildLayout(int index, Widget widget) {
    return Expanded(
      flex: index,
      child: Container(
        width: double.infinity,
        color: white,
        child: widget,
      ),
    );
  }
}

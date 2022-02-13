import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/icon_widget.dart';
import 'package:loy_eat/widgets/layout_widget/space.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';

class EnterOTPCodePageWidget extends StatefulWidget {
  const EnterOTPCodePageWidget({Key? key}) : super(key: key);

  @override
  _EnterOTPCodePageWidgetState createState() => _EnterOTPCodePageWidgetState();
}

class _EnterOTPCodePageWidgetState extends State<EnterOTPCodePageWidget> {
  String phoneNumber = "093 807 ***";
  late Timer _timer;
  int _start = 60;

  TextEditingController opt1 = TextEditingController();
  TextEditingController opt2 = TextEditingController();
  TextEditingController opt3 = TextEditingController();
  TextEditingController opt4 = TextEditingController();
  TextEditingController opt5 = TextEditingController();
  TextEditingController opt6 = TextEditingController();

  final List<TextEditingController> listController = [];

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
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
    listController.add(opt1);
    listController.add(opt2);
    listController.add(opt3);
    listController.add(opt4);
    listController.add(opt5);
    listController.add(opt6);
    opt1.text = '1';
    opt2.text = '2';
    opt3.text = '3';
    opt4.text = '4';
    opt5.text = '5';
    opt6.text = '6';
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
            _buildLayout(5, _buildBody),
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
            width: 50,
            height: 50,
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: rabbit,
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Center(
              child: IconWidget(
                icon: Icons.lock_open_outlined,
                color: white,
                size: 24,
              ),
            ),
          ),
          const TextWidget(
            isTitle: true,
            text: 'Enter Code',
          ),
          Container(
            width: 250,
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: TextWidget(
              textAlign: TextAlign.center,
              text: 'Enter your one-time password (OTP) sent to $phoneNumber',
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(text: 'Expire in $_start seconds. ', color: silver,),
                const TextWidget(text: 'Resend Code', color: rabbit,),
              ],
            ),
          ),
          const Space(height: 10),
          SizedBox(
            height: 30,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index){
                    return Padding(
                      padding: index == 6 ? const EdgeInsets.only(left: 0.0) : const EdgeInsets.only(left: 8.0),
                      child: _otpTextField(context, index == 0 ? true : false, listController[index]),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: white,
              width: 250,
              margin: const EdgeInsets.only(top: 5),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 80,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                  ),
                  itemCount: 12,
                  itemBuilder: (BuildContext ctx, index) {
                    return index == 11 ? _buildDelete() : _buildNumber(index < 9 ?'${index + 1}' : index == 9 ? 'C' : '0');
                  }),
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
  Widget _otpTextField(BuildContext context, bool autoFocus, TextEditingController controller) {
    return  SizedBox(
      width: 30,
      child: AspectRatio(
        aspectRatio: 1,
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(3, 0, 0, 10),
            enabledBorder: UnderlineInputBorder(
              borderSide:  BorderSide(color: text),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: text),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: text),
            ),
          ),
          autofocus: autoFocus,
          readOnly: true,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 14, color: rabbit),
          maxLines: 1,
          onChanged: (value) {
            if(value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
  Widget _buildNumber(String number){
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: text),
      ),
      child: Center(
        child: TextWidget(
          text: number,
          size: 16,
        ),
      ),
    );
  }
  Widget _buildDelete(){
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: text),
      ),
      child: const Center(
        child: IconWidget(
          icon: Icons.backspace_outlined,
          color: black,
          size: 24,
        ),
      ),
    );
  }
}
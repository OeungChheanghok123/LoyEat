import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loy_eat/screens/flash_screen/instruction_page.dart';
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
  late String otpNumber;
  bool isErrorOtp = false;

  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  TextEditingController otp5 = TextEditingController();
  TextEditingController otp6 = TextEditingController();

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
    listController.add(otp1);
    listController.add(otp2);
    listController.add(otp3);
    listController.add(otp4);
    listController.add(otp5);
    listController.add(otp6);
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
                InkWell(
                  onTap: (){
                    setState(() {
                      _timer.cancel();
                      _start = 60;
                      startTimer();
                    });
                  },
                  child: const TextWidget(text: 'Resend Code', color: rabbit,),
                ),
              ],
            ),
          ),
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
          const Space(height: 10),
          TextWidget(text: 'Verification failed. Please try again', color: isErrorOtp ? red : none, size: 10),
          Expanded(
            child: Container(
              color: white,
              width: 250,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 80,
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 25,
                ),
                itemCount: 12,
                itemBuilder: (BuildContext ctx, index) {
                  return index == 11 ? _buildDelete() :
                    _buildNumber(index + 1, index < 9 ?'${index + 1}' : index == 9 ? 'C' : '0');
                },
              ),
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
          style: TextStyle(fontSize: 14, color: isErrorOtp ? red : rabbit),
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
  Widget _buildNumber(int index, String number){
    return InkWell(
      onTap: (){
        setState(() {
          if (index == 10){
            isErrorOtp = false;
            otp1.text = '';
            otp2.text = '';
            otp3.text = '';
            otp4.text = '';
            otp5.text = '';
            otp6.text = '';
          } else {
            if (index == 11) index = 0;
            if (otp1.text == ''){
              otp1.text = '$index';
            } else if (otp1.text != '' && otp2.text == ''){
              otp2.text = '$index';
            } else if (otp1.text != '' && otp2.text != '' && otp3.text == ''){
              otp3.text = '$index';
            } else if (otp1.text != '' && otp2.text != '' && otp3.text != '' && otp4.text == ''){
              otp4.text = '$index';
            } else if (otp1.text != '' && otp2.text != '' && otp3.text != '' && otp4.text != '' && otp5.text == ''){
              otp5.text = '$index';
            } else if (otp1.text != '' && otp2.text != '' && otp3.text != '' && otp4.text != '' && otp5.text != '' && otp6.text == ''){
              otp6.text = '$index';
            }
          }
          otpNumber = (otp1.text + otp2.text + otp3.text + otp4.text + otp5.text + otp6.text).toString();
          if (otp6.text != ''){
            if (otpNumber == '123456'){
              _timer.cancel();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InstructionPage()));
            }
            else {
              isErrorOtp = true;
            }
          }
        });
      },
      child: Container(
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
      ),
    );
  }
  Widget _buildDelete(){
    return InkWell(
      onTap: (){
        setState(() {
          isErrorOtp = false;
        });
        if (otp2.text == ''){
          otp1.text = '';
        } else if (otp3.text == ''){
          otp2.text = '';
        } else if (otp4.text == ''){
          otp3.text = '';
        } else if (otp5.text == ''){
          otp4.text = '';
        } else if (otp6.text == ''){
          otp5.text = '';
        } else if (otp6.text != ''){
          otp6.text = '';
        }
      },
      child: Container(
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
      ),
    );
  }
}
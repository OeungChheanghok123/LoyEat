import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';

class OtpTest extends StatelessWidget {
  const OtpTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const Scaffold(
    //   extendBody: true,
    //   backgroundColor: white,
    //   appBar: null,
    //   body: EnterOTPCodePageWidget(),
    // );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child:  Wrap(
          alignment: WrapAlignment.start,
          spacing: 4,
          direction: Axis.horizontal,
          runSpacing: 10,
          children: [
            _otpTextField(context, true),
            _otpTextField(context, false),
            _otpTextField(context, false),
            _otpTextField(context, false),
            _otpTextField(context, false),
            _otpTextField(context, false),
          ],
        ),
      ),
    );
  }

  Widget _otpTextField(BuildContext context, bool autoFocus) {
    return  SizedBox(
      width: 30,
      child: AspectRatio(
        aspectRatio: 1,
        child: Center(
          child: TextField(
            autofocus: autoFocus,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(3, 0, 0, 5),
              enabledBorder: UnderlineInputBorder(
                borderSide:  BorderSide(color: rabbit),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: rabbit),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: rabbit),
              ),
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 14),
            maxLines: 1,
            onChanged: (value) {
              if(value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
          ),
        ),
      ),
    );
  }
}

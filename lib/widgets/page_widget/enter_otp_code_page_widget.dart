import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/icon_widget.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';

class EnterOTPCodePageWidget extends StatefulWidget {
  const EnterOTPCodePageWidget({Key? key}) : super(key: key);

  @override
  _EnterOTPCodePageWidgetState createState() => _EnterOTPCodePageWidgetState();
}

class _EnterOTPCodePageWidgetState extends State<EnterOTPCodePageWidget> {
  String phoneNumber = "093 807 ***";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 5, 15, 15),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLayout(1, Container()),
            _buildLayout(4, _buildBody),
          ],
        ),
      ),
    );
  }

  Widget get _buildBody{
    return SizedBox(
      width: double.infinity,
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
              children: const [
                TextWidget(text: 'Expire in 60 seconds. ', color: silver,),
                TextWidget(text: 'Resend Code', color: rabbit,),
              ],
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

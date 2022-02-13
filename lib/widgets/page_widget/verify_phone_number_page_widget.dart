import 'package:flutter/material.dart';
import 'package:loy_eat/screens/flash_screen/enter_otp_code_page.dart';
import 'package:loy_eat/widgets/layout_widget/button_widget.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/icon_widget.dart';
import 'package:loy_eat/widgets/layout_widget/space.dart';
import 'package:loy_eat/widgets/layout_widget/text_field_widget.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';

class VerifyPhoneNumberPageWidget extends StatefulWidget {
  const VerifyPhoneNumberPageWidget({Key? key}) : super(key: key);

  @override
  _VerifyPhoneNumberPageWidgetState createState() => _VerifyPhoneNumberPageWidgetState();
}

class _VerifyPhoneNumberPageWidgetState extends State<VerifyPhoneNumberPageWidget> {
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

  Widget get _buildBody {
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
            text: 'Verify Phone Number',
          ),
          Container(
            width: 250,
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: const TextWidget(
              textAlign: TextAlign.center,
              text: 'Enter your mobile phone number to receive one-time password (OTP)',
            ),
          ),
          Container(
            width: 250,
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: const TextFieldWidget(
              height: 50,
              inputType: TextInputType.number,
              borderRadius: 20,
              hintText: 'Enter your phone number',
              isPrefixIcon: true,
              prefixIcon: Icon(
                Icons.phone,
                size: 20,
                color: rabbit,
              ),
            ),
          ),
          ButtonWidget(
            height: 40,
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const EnterOTPCodePage()));
            },
            borderRadius: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                TextWidget(
                  isTitle: true,
                  text: 'Next',
                  color: white,
                ),
                Space(),
                IconWidget(
                  icon: Icons.double_arrow,
                  size: 20,
                  color: white,
                ),
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

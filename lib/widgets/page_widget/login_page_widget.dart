import 'package:flutter/material.dart';
import 'package:loy_eat/screens/flash_screen/become_driver_page.dart';
import 'package:loy_eat/screens/flash_screen/verify_phone_number_page.dart';
import 'package:loy_eat/widgets/layout_widget/button_widget.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/svg_picture_widget.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';


class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: size.width,
          height: size.height,
          color: white,
          child: const SvgPictureWidget(
            imageString: 'assets/image/loy_eat_logo.svg',
            label: 'LoyEat Logo',
          ),
        ),
        Positioned(
          bottom: 50,
          child: SizedBox(
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildButton("Log In", rabbit, const VerifyPhoneNumberPage()),
                _buildButton("Become a Driver?", carrot, const BecomeDriver()),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButton(String text, Color color, Widget page){
    return ButtonWidget(
      width: 160,
      height: 50,
      color: color,
      onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page)),
      child: TextWidget(
        isTitle: true,
        text: text,
        color: white,
      ),
    );
  }
}

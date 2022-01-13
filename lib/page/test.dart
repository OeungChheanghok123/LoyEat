import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loy_eat/controller/color.dart';
import 'package:loy_eat/page/instruction_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SvgPicture.asset(
              'assets/image/loy_eat_logo.svg',
              placeholderBuilder: (context) => const CircularProgressIndicator(),
              semanticsLabel: 'LoyEat Logo',
            ),
          ),
          Positioned(
            bottom: 50,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InstructionPage())),
                    child: _buildButton("Log In", rabbit),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InstructionPage())),
                    child: _buildButton("Become a Driver?", carrot),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, Color color){
    return Container(
      width: 150,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: white,
        ),
      ),
    );
  }
}
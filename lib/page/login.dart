import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loy_eat/controller/color.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                color: white,
                child: SvgPicture.asset(
                  'assets/image/loy_eat_logo.svg',
                  placeholderBuilder: (context) => const CircularProgressIndicator(),
                  semanticsLabel: 'LoyEat Logo',
                  alignment: Alignment.center,
                ),
              ),
              Positioned(
                bottom: 50,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildButton("Log In", rabbit),
                      _buildButton("Become a Driver?", carrot),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildButton(String text, Color color){
    return Container(
      alignment: Alignment.center,
      width: 170,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:loy_eat/controller/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loy_eat/page/login.dart';

class InstructionPage extends StatelessWidget {
  const InstructionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          StartUpPage(),
        ],
      ),
    );
  }
}

class StartUpPage extends StatefulWidget {
  const StartUpPage({Key? key}) : super(key: key);

  @override
  _StartUpPageState createState() => _StartUpPageState();
}

class _StartUpPageState extends State<StartUpPage> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          color: rabbit,
          child: SvgPicture.asset(
            'assets/image/loy_eat_logo.svg',
            placeholderBuilder: (context) => const CircularProgressIndicator(),
            semanticsLabel: 'LoyEat Logo',
            alignment: Alignment.center,
          ),
        ),
        Positioned(
          bottom: 50,
          child: FutureBuilder(
            future: Future.delayed(const Duration(seconds: 3)),
            builder: (c, s) => s.connectionState == ConnectionState.done ? _selectLanguage : Container(),
          ),
        ),
      ],
    );
  }

  Widget get _selectLanguage{
    return Container(
      width: 150,
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text("ជ្រើសរើសភាសា",
              style: TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLanguage('assets/image/cambodia_flag.svg', 'ខ្មែរ', 'Cambodia Flag Logo'),
              _buildLanguage('assets/image/uk_flag.svg', 'English', 'United kingdom Flag Logo'),
            ],
          )
        ],
      ),
    );
  }

  _buildLanguage(String image, String text, String label){
    return GestureDetector(
      onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage())),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 55,
            height: 35,
            color: Colors.transparent,
            child: SvgPicture.asset(image,
              fit: BoxFit.cover,
              placeholderBuilder: (context) => const CircularProgressIndicator(),
              semanticsLabel: label,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(text,
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:loy_eat/controller/color.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return Column(
      children: <Widget>[
        const Text("ជ្រើសរើសភាសា"),
        Row(
          children: [
            language('assets/image/cambodia_flag.svg', 'ខ្មែរ', 'Cambodia Flag Logo'),
            language('assets/image/english_logo.png', 'English', 'English Flag Logo'),
          ],
        )
      ],
    );
  }

  language(String image, String text, String label){
    return Column(
      children: [
        Container(
          width: 55,
          height: 35,
          color: Colors.transparent,
          child: SvgPicture.asset(image,
            placeholderBuilder: (context) => const CircularProgressIndicator(),
            semanticsLabel: label,
          ),
        ),
        Text(text),
      ],
    );
  }
}
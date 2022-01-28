import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loy_eat/screens/flash_screen/login_page.dart';

class StartUpPage extends StatelessWidget {
  const StartUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rabbit,
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
            child: FutureBuilder(
              future: Future.delayed(const Duration(seconds: 3)),
              builder: (c, s) => s.connectionState == ConnectionState.done
                  ? InkWell(
                      onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage())),
                      child: _selectLanguage,
                    )
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _selectLanguage{
    return SizedBox(
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text("ជ្រើសរើសភាសា",
              style: TextStyle(
                fontSize: 14,
                color: white,
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
          ),
        ],
      ),
    );
  }

  Widget _buildLanguage(String image, String text, String label){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 55,
          height: 35,
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
              fontSize: 12,
              color: white,
            ),
          ),
        ),
      ],
    );
  }
}
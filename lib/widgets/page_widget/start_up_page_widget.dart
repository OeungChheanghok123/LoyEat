import 'package:flutter/material.dart';
import 'package:loy_eat/screens/flash_screen/login_page.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/space.dart';
import 'package:loy_eat/widgets/layout_widget/svg_picture_widget.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';

class StartUpPageWidget extends StatefulWidget {
  const StartUpPageWidget({Key? key}) : super(key: key);

  @override
  _StartUpPageWidgetState createState() => _StartUpPageWidgetState();
}

class _StartUpPageWidgetState extends State<StartUpPageWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: size.width,
          height: size.height,
          color: rabbit,
          child: const SvgPictureWidget(
            imageString: 'assets/image/loy_eat_logo.svg',
            label: 'Loy Eat Logo',
          ),
        ),
        Positioned(
          bottom: 50,
          child: FutureBuilder(
            future: Future.delayed(const Duration(seconds: 3)),
            builder: (c, s) => s.connectionState == ConnectionState.done
            ? InkWell(
              splashColor: Colors.transparent,
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage())),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const TextWidget(
                    isTitle: true,
                    text: 'ជ្រើសរើសភាសា',
                    color: white,
                  ),
                  const Space(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildLanguage('assets/image/cambodia_flag.svg', 'ខ្មែរ', 'Cambodia Flag Logo'),
                      const Space(width: 35),
                      _buildLanguage('assets/image/uk_flag.svg', 'English', 'United kingdom Flag Logo'),
                    ],
                  ),
                ],
              ),
            )
            : Container(),
          ),
        ),
      ],
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
          child: SvgPictureWidget(
            imageString: image,
            label: label,
          ),
        ),
        const Space(height: 5),
        TextWidget(
          text: text,
          color: white,
        ),
      ],
    );
  }
}

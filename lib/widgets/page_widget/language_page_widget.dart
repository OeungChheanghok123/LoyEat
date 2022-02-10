import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/icon_widget.dart';
import 'package:loy_eat/widgets/layout_widget/space.dart';
import 'package:loy_eat/widgets/layout_widget/svg_picture_widget.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';

class LanguagePageWidget extends StatefulWidget {
  const LanguagePageWidget({Key? key}) : super(key: key);

  @override
  _LanguagePageWidgetState createState() => _LanguagePageWidgetState();
}

class _LanguagePageWidgetState extends State<LanguagePageWidget> {

  String khmerImage = 'assets/image/cambodia_flag.svg';
  String ukImage = 'assets/image/uk_flag.svg';
  String khmerLabel = 'ខ្មែរ';
  String ukLabel = 'English';

  bool isSelectedKhmer = false;
  bool isSelectedEnglish = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.fromLTRB(15, 5, 15, 15),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              color: white,
              elevation: 10,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Column(
                  children: [
                    _buildTitle,
                    _buildSelectedLanguage,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildTitle{
    return const TextWidget(isTitle: true, text: 'Choose Language');
  }
  Widget get _buildSelectedLanguage{
    return Container(
      color: white,
      width: 120,
      child: Column(
        children: [
          const Space(height: 15),
          _buildLanguage(1, khmerImage, 'Khmer Language', khmerLabel, isSelectedKhmer ? rabbit : white),
          const Space(height: 10),
          _buildLanguage(2, ukImage, 'English Language', ukLabel, isSelectedEnglish ? rabbit : white),
        ],
      ),
    );
  }

  Widget _buildLanguage(int index, String image, String labelImage, String text, Color colorChecker){
    return InkWell(
      splashColor: none,
      hoverColor: none,
      highlightColor: none,
      focusColor: none,
      onTap: (){
        setState(() {
          if (index == 1){
            isSelectedKhmer = true;
            isSelectedEnglish = false;
          } else {
            isSelectedEnglish = true;
            isSelectedKhmer = false;
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 25,
                  height: 20,
                  child: SvgPictureWidget(
                    imageString: image,
                    label: labelImage,
                  ),
                ),
                const Space(width: 10),
                TextWidget(text: text, size: 14),
              ],
            ),
            IconWidget(
              icon: Icons.done_outlined,
              size: 18,
              color: colorChecker,
            ),
          ],
        ),
      ),
    );
  }
}

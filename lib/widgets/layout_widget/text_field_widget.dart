import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';

class TextFieldWidget extends StatelessWidget {
  final TextInputType inputType;
  final double height;
  final TextAlign textAlign;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final double contentPaddingLeft;
  final String hintText;
  final Color hintColor;
  final double borderRadius;
  final double marginVertical;
  const TextFieldWidget({
    Key? key,
    required this.inputType,
    required this.height,
    this.textAlign = TextAlign.start,
    this.fontSize = 12,
    this.textColor = black,
    this.fontWeight = FontWeight.normal,
    this.contentPaddingLeft = 10,
    this.hintText = '',
    this.hintColor = silver,
    this.borderRadius = 5,
    this.marginVertical = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: marginVertical),
      height: height,
      child: TextField(
        keyboardType: inputType,
        textAlign: textAlign,
        autocorrect: false,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(contentPaddingLeft, 0, 0, 0),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: hintColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';

class TextFieldWidget extends StatelessWidget {
  final TextInputType inputType;
  final double height;
  final double width;
  final TextAlign textAlign;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final double contentPaddingLeft;
  final String hintText;
  final Color hintColor;
  final double borderRadius;
  final double marginVertical;
  final bool isSuffixIcon;
  final Icon suffixIcon;

  const TextFieldWidget({
    Key? key,
    required this.inputType,
    required this.height,
    this.width = double.infinity,
    this.textAlign = TextAlign.start,
    this.fontSize = 12,
    this.textColor = black,
    this.fontWeight = FontWeight.normal,
    this.contentPaddingLeft = 10,
    this.hintText = '',
    this.hintColor = silver,
    this.borderRadius = 5,
    this.marginVertical = 10,
    this.isSuffixIcon = false,
    this.suffixIcon = const Icon(null),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: marginVertical),
      height: height,
      width: width,
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
          suffixIcon: isSuffixIcon ? suffixIcon : null,
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
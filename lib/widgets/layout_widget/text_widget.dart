import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final bool isTitle;

  const TextWidget({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.size = 12,
    this.fontWeight = FontWeight.normal,
    this.color = black,
    this.isTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(text,
    textAlign: textAlign,
    style: isTitle ? TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: color,
    ) : TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}

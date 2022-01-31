import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';

class ButtonWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final VoidCallback onPressed;
  final BorderSide borderSide;
  final double borderRadius;
  final Widget child;

  const ButtonWidget({
    Key? key,
    this.width = 150,
    this.height = 50,
    this.color = rabbit,
    this.borderSide = BorderSide.none,
    this.borderRadius = 10,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(Colors.transparent),
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: borderSide,
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
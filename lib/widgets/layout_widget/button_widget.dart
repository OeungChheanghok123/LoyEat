import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';

class ButtonWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final VoidCallback onPressed;
  final Widget child;

  const ButtonWidget({
    Key? key,
    this.width = 150,
    this.height = 50,
    this.color = rabbit,
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
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}

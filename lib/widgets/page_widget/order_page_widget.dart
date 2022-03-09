import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/icon_widget.dart';
import 'package:loy_eat/widgets/layout_widget/space.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';

class OrderPageWidget extends StatefulWidget {
  const OrderPageWidget({Key? key}) : super(key: key);

  @override
  State<OrderPageWidget> createState() => _OrderPageWidgetState();
}

class _OrderPageWidgetState extends State<OrderPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          IconWidget(icon: Icons.shopping_basket, color: carrot, size: 100,),
          Space(height: 10),
          TextWidget(text: 'Sorry, No order yet!', size: 14, fontWeight: FontWeight.bold,),
        ],
      ),
    );
  }
}

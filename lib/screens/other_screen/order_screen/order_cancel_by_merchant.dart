import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/icon_widget.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';

class OrderCancelByMerchant extends StatelessWidget {
  const OrderCancelByMerchant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const IconWidget(icon: Icons.sentiment_very_dissatisfied, color: carrot, size: 64,),
          Container(
            width: 280,
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const TextWidget(
              text: 'Sorry! Order #123456 has been canceled by Cafe Amazon (PPIU) due to ...', fontWeight: FontWeight.w600, textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}

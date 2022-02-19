import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/icon_widget.dart';
import 'package:loy_eat/widgets/layout_widget/space.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';

class ReportPageWidget extends StatefulWidget {
  const ReportPageWidget({Key? key}) : super(key: key);

  @override
  _ReportPageWidgetState createState() => _ReportPageWidgetState();
}

class _ReportPageWidgetState extends State<ReportPageWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDateMonthReport,
            _buildDetailBar,
            _buildReportBody,
          ],
        ),
      ),
    );
  }

  Widget get _buildDateMonthReport{
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        TextWidget(text: 'Dec 2021'),
        IconWidget(icon: Icons.arrow_drop_down_sharp, size: 20, color: black),
      ],
    );
  }
  Widget get _buildDetailBar{
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TextWidget(isTitle: true, text: 'Order Details'),
          Row(
            children: [
              _buildIconAndText(Icons.cancel, black, 'Canceled'),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: 1,
                height: 15,
                color: black,
              ),
              _buildIconAndText(Icons.check_circle, rabbit, 'Delivered'),
            ],
          ),
        ],
      ),
    );
  }
  Widget get _buildReportBody{
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            TextWidget(text: '20 Dec - 26 Dec', fontWeight: FontWeight.bold),
            TextWidget(text: 'Total Earning = \$50.00'),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          width: double.infinity,
          height: 2,
          color: silver,
        ),
        Column(
          children: [
            const Space(),
            Row(
              children: [
                const Expanded(
                  flex: 0,
                  child: TextWidget(text: '1. '),
                ),
                const Expanded(
                  flex: 5,
                  child: TextWidget(
                    text: 'Order #: 123456, your earning',
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
                    color: rabbit,
                    child: const TextWidget(text: '\$12.00', fontWeight: FontWeight.bold, color: white,),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget _buildIconAndText(IconData iconData, Color color, String text){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconWidget(icon: iconData, color: color, size: 12),
        const Space(width: 1),
        TextWidget(text: text, color: color),
      ],
    );
  }
}
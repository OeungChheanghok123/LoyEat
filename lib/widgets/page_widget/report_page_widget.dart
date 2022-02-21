import 'package:dotted_line/dotted_line.dart';
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
              _buildIconAndText(Icons.cancel, black, 'Canceled', 12),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: 1,
                height: 15,
                color: black,
              ),
              _buildIconAndText(Icons.check_circle, rabbit, 'Delivered', 12),
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
            const Space(height: 10),
            Row(
              children: [
                const Expanded(
                  flex: 0,
                  child: TextWidget(text: '1. ', color: none),
                ),
                const Expanded(
                  flex: 2,
                  child: TextWidget(
                    text: 'From Cafe Amazon (PPIU) to Sovongdy', size: 10, color: silver
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildIconAndText(Icons.directions_bike_outlined, silver, '1.2km', 9),
                      const Space(),
                      _buildIconAndText(Icons.watch_later, silver, '20min', 9),
                    ],
                  )
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: const DottedLine(
                dashLength: 1.5,
                lineThickness: 2,
                dashColor: silver,
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget _buildIconAndText(IconData iconData, Color color, String text, double textSize){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconWidget(icon: iconData, color: color, size: 12),
        const Space(width: 1),
        TextWidget(text: text, color: color, size: textSize),
      ],
    );
  }
}
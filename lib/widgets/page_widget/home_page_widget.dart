import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/icon_widget.dart';
import 'package:loy_eat/widgets/layout_widget/space.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  String online = '30h:22m';
  String trips = '17';
  String points = '150';
  String distance = '30Km';
  String customerRating = '4.5/5 rating';
  String merchantRating = '4.0/5 rating';

  double deliveryFee = 3;
  double bonus = 3;
  double tip = 3;
  late double totalEarnings;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: size.width,
        margin: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            _buildDatePicker,
            _buildChart,
            _buildStatus,
            _buildBreakDown,
          ],
        ),
      ),
    );
  }

  Widget get _buildDatePicker {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget> [
              TextWidget(text: '15 - Nov - 2021'),
              Space(width: 5),
              IconWidget(icon: Icons.arrow_right_alt, color: black),
              Space(width: 5),
              TextWidget(text: '22 - Nov - 2021'),
              Space(width: 5),
              IconWidget(icon: Icons.arrow_drop_down, color: black),
            ],
          ),
        ),
      ],
    );
  }
  Widget get _buildChart {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 5),
      color: rabbit,
      height: 180,
    );
  }
  Widget get _buildStatus {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 15, 25, 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(isTitle: true, text: 'Stats'),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget(text: 'Online'),
                        const Space(),
                        Container(
                          padding: const EdgeInsets.only(left: 1.5),
                          child: _buildDetailText(online),
                        ),
                      ],
                    ),
                    const Space(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget(text: 'Distance'),
                        const Space(),
                        Container(
                          padding: const EdgeInsets.only(left: 1.5),
                          child: _buildDetailText(distance),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget(text: 'Trips'),
                        const Space(),
                        Container(
                          padding: const EdgeInsets.only(left: 1.5),
                          child: _buildDetailText(trips),
                        ),
                      ],
                    ),
                    const Space(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget(text: 'Customer'),
                        const Space(),
                        Container(
                          padding: const EdgeInsets.only(left: 1.5),
                          child: _buildDetailText(customerRating),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget(text: 'Points'),
                        const Space(),
                        Container(
                          padding: const EdgeInsets.only(left: 1.5),
                          child: _buildDetailText(points),
                        ),
                      ],
                    ),
                    const Space(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget(text: 'Merchant'),
                        const Space(),
                        Container(
                          padding: const EdgeInsets.only(left: 1.5),
                          child: _buildDetailText(merchantRating),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget get _buildBreakDown {
    totalEarnings = deliveryFee + bonus + tip;
    const space = Space(height: 8);

    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 25, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const TextWidget(isTitle: true, text: 'Breakdown'),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextWidget(text: 'Net delivery fee'),
                    TextWidget(text: '\$${deliveryFee.toStringAsFixed(2)}'),
                  ],
                ),
                space,
                const DottedLine(
                  dashLength: 1.5,
                  lineThickness: 2,
                  dashColor: silver,
                ),
                space,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextWidget(text: 'Bonus'),
                    TextWidget(text: '\$${bonus.toStringAsFixed(2)}'),
                  ],
                ),
                space,
                const DottedLine(
                  dashLength: 1.5,
                  lineThickness: 2,
                  dashColor: silver,
                ),
                space,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextWidget(text: 'Tip'),
                    TextWidget(text: '\$${tip.toStringAsFixed(2)}'),
                  ],
                ),
                space,
                Container(
                  height: 1,
                  color: silver,
                ),
                space,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextWidget(text: 'Total Earnings'),
                    Container(
                      color: rabbit,
                      child: TextWidget(text: '\$${totalEarnings.toStringAsFixed(2)}', fontWeight: FontWeight.bold, color: white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailText(String text) => TextWidget(text: text, fontWeight: FontWeight.bold);
}

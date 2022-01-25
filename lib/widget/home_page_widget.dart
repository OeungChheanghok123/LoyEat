import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:loy_eat/controller/color.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  String online = '30h:22m';
  String trips = '17';
  String points = '150';
  String distance = '30km';
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildText('15 - Nov - 2021', 14, FontWeight.normal),
              _buildIcon(Icons.arrow_right_alt, black, 20),
              _buildText('22 - Nov - 2021', 14, FontWeight.normal),
            ],
          ),
        ),
        _buildIcon(Icons.arrow_drop_down, black, 20),
      ],
    );
  }
  Widget get _buildChart {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 5),
      color: white,
      height: 170,
    );
  }
  Widget get _buildStatus {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 15, 25, 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildText('Stats', 14, FontWeight.bold),
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
                        _buildText('Online', 12, FontWeight.normal),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 1.5),
                          child: _buildText(online, 12, FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildText('Distance', 12, FontWeight.normal),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 1.5),
                          child: _buildText(distance, 12, FontWeight.bold),
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
                        _buildText('Trips', 12, FontWeight.normal),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 1.5),
                          child: _buildText(trips, 12, FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildText('Customer', 12, FontWeight.normal),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 1.5),
                          child: _buildText(customerRating, 12, FontWeight.bold),
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
                        _buildText('Points', 12, FontWeight.normal),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 1.5),
                          child: _buildText(points, 12, FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildText('Merchant', 12, FontWeight.normal),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 1.5),
                          child: _buildText(merchantRating, 12, FontWeight.bold),
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
    const space = SizedBox(height: 8);
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 25, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildText('Breakdown', 14, FontWeight.bold),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildText('Net delivery fee', 12, FontWeight.normal),
                    _buildText('\$${deliveryFee.toStringAsFixed(2)}', 12, FontWeight.normal),
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
                    _buildText('Bonus', 12, FontWeight.normal),
                    _buildText('\$${bonus.toStringAsFixed(2)}', 12, FontWeight.normal),
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
                    _buildText('Tip', 12, FontWeight.normal),
                    _buildText('\$${tip.toStringAsFixed(2)}', 12, FontWeight.normal),
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
                    _buildText('Total Earnings', 12, FontWeight.bold),
                    Container(
                      color: rabbit,
                      child: Text('\$${totalEarnings.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: white,
                        ),
                      ),
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

  Widget _buildText(String text, double fontSize, FontWeight fontWeight) => Text(text,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: black,
    ),
  );
  Widget _buildIcon(IconData icon, Color color, double size) => Icon(icon,
    color: color,
    size: size,
  );
}

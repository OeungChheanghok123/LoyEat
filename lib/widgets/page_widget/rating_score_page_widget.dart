import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/icon_widget.dart';
import 'package:loy_eat/widgets/layout_widget/space.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';

class RatingScorePageWidget extends StatefulWidget {
  const RatingScorePageWidget({Key? key}) : super(key: key);

  @override
  _RatingScorePageWidgetState createState() => _RatingScorePageWidgetState();
}

class _RatingScorePageWidgetState extends State<RatingScorePageWidget> {
  double totalScorePercentage = 82.5;
  double totalCustomerPercentage = 80;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: size.width,
        margin: const EdgeInsets.fromLTRB(15, 5, 15, 15),
        child: Column(
          children: <Widget>[
            _buildTotalScore,
            _buildUnderLine,
            _buildSatisfactionDetail,
          ],
        ),
      ),
    );
  }

  Widget get _buildTotalScore{
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          const TextWidget(text: 'Total Satisfaction Score'),
          const Space(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(text: '$totalScorePercentage%', isTitle: true, color: rabbit,),
              const Space(),
              const IconWidget(icon: Icons.thumb_up),
            ],
          ),
          const Space(),
          const TextWidget(text: '(Aim >= 90%)', color: rabbit,)
        ],
      ),
    );
  }
  Widget get _buildUnderLine{
    return Container(
      width: double.infinity,
      height: 1.5,
      color: silver,
      margin: const EdgeInsets.fromLTRB(5, 10, 5, 5),
    );
  }
  Widget get _buildSatisfactionDetail{
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(text: 'Satisfaction Detail', isTitle: true,),
          _buildCustomerRating,
        ],
      ),
    );
  }

  Widget get _buildCustomerRating{
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(text: 'Customer', color: rabbit,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: '$totalCustomerPercentage%', fontWeight: FontWeight.bold, color: rabbit,),
                  const Space(),
                  const IconWidget(icon: Icons.thumb_up, size: 15,),
                ],
              ),
            ],
          ),
          const Space(),
          const DottedLine(
            dashLength: 2.5,
            lineThickness: 2,
            dashColor: silver,
          ),
        ],
      ),
    );
  }
}

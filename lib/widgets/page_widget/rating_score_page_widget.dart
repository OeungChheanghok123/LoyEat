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
  double totalMerchantPercentage = 85;

  int feedbackAllCounter = 12;
  int feedbackCustomerCounter = 10;
  int feedbackMerchantCounter = 2;

  bool isFeedbackAll = true;
  bool isFeedbackCustomer = false;
  bool isFeedbackMerchant = false;

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
            _buildHorizontalLine,
            _buildSatisfactionDetail,
            _buildHorizontalLine,
            _buildRecentFeedback,
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
  Widget get _buildSatisfactionDetail{
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(text: 'Satisfaction Detail', isTitle: true,),
          _buildCustomerRating,
          _buildMerchantRating,
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                TextWidget(text: 'All time ratings', size: 10,),
                Space(width: 3),
                IconWidget(icon: Icons.keyboard_arrow_down, color: black, size: 18,),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget get _buildRecentFeedback{
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextWidget(text: 'Recent Feedback', isTitle: true,),
              Row(
                children: [
                  _buildMenuFeedback(1, 'All', isFeedbackAll ? rabbit : black, '$feedbackAllCounter', isFeedbackAll ? rabbit : text),
                  _buildVerticalLine,
                  _buildMenuFeedback(2, 'Customer', isFeedbackCustomer ? rabbit : black, '$feedbackCustomerCounter', isFeedbackCustomer ? rabbit : text),
                  _buildVerticalLine,
                  _buildMenuFeedback(3, 'Merchant', isFeedbackMerchant ? rabbit : black, '$feedbackMerchantCounter', isFeedbackMerchant ? rabbit : text),
                ],
              ),
            ],
          ),
          _buildDetailFeedbackAndRating(1, 'You did a great service.', 4),
          _buildDetailFeedbackAndRating(2, 'You did a great service. Keep your work.', 5),
          _buildDetailFeedbackAndRating(3, 'Why too late? I don\'t like.', 3),
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
                  const Space(),
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
          Column(
            children: [
              const Space(),
              _buildStarRating(5),
              _buildStarRating(4),
              _buildStarRating(3),
              _buildStarRating(2),
              _buildStarRating(1),
            ],
          )
        ],
      ),
    );
  }
  Widget get _buildMerchantRating{
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(text: 'Merchant', color: rabbit,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: '$totalMerchantPercentage%', fontWeight: FontWeight.bold, color: rabbit,),
                  const Space(),
                  const IconWidget(icon: Icons.thumb_up, size: 15,),
                  const Space(),
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
          Column(
            children: [
              const Space(),
              _buildStarRating(5),
              _buildStarRating(4),
              _buildStarRating(3),
              _buildStarRating(2),
              _buildStarRating(1),
            ],
          )
        ],
      ),
    );
  }
  Widget get _buildHorizontalLine{
    return Container(
      width: double.infinity,
      height: 1.5,
      color: silver,
      margin: const EdgeInsets.fromLTRB(5, 10, 5, 5),
    );
  }
  Widget get _buildVerticalLine{
    return Container(
      width: 1,
      height: 12,
      color: black,
    );
  }
  Widget _buildStarRating(int itemCount){
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: double.minPositive,
              height: 20,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemCount,
                itemBuilder: (BuildContext context, int index){
                  return Row(
                    children: [
                      IconWidget(icon: itemCount > 1 ? Icons.star_outlined : Icons.star_border_outlined, color: black, size: 18,),
                      const Space(width: 15),
                    ],
                  );
                },
              ),
            ),
          ),
          TextWidget(text: itemCount > 1 ? '${itemCount*2}' : '0'),
          const Space(),
        ],
      ),
    );
  }
  Widget _buildMenuFeedback(int index, String txt, Color txtColor, String counterTxt, Color counterColor){
    return InkWell(
      splashColor: none,
      focusColor: none,
      hoverColor: none,
      highlightColor: none,
      onTap: (){
        setState(() {
          if (index == 1){
            isFeedbackAll = true;
            isFeedbackCustomer = false;
            isFeedbackMerchant = false;
          } else if (index == 2){
            isFeedbackCustomer = true;
            isFeedbackAll = false;
            isFeedbackMerchant = false;
          } else {
            isFeedbackMerchant = true;
            isFeedbackAll = false;
            isFeedbackCustomer = false;
          }
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 8, 6, 5),
            child: TextWidget(text: txt, size: 8, color: txtColor,),
          ),
          Positioned(
            top: 1,
            right: 3,
            child: Container(
              height: 9,
              width: 9,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: counterColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: TextWidget(text: counterTxt, size: 4, color: white, textAlign: TextAlign.center,),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildDetailFeedbackAndRating(int index, String text, int itemCount){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: -1,
                  child: TextWidget(text: '$index '),
                ),
                Expanded(
                  child: TextWidget(text: text),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.minPositive,
              height: 20,
              margin: const EdgeInsets.only(left: 45),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemCount,
                itemBuilder: (BuildContext context, int index){
                  return Row(
                    children: const [
                      IconWidget(icon: Icons.star_outlined, color: black, size: 20,),
                      Space(width: 3),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

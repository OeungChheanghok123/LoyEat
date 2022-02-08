import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/button_widget.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/space.dart';
import 'package:loy_eat/widgets/layout_widget/text_field_widget.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';

class FeedbackPageWidget extends StatefulWidget {
  const FeedbackPageWidget({Key? key}) : super(key: key);

  @override
  _FeedbackPageWidgetState createState() => _FeedbackPageWidgetState();
}

class _FeedbackPageWidgetState extends State<FeedbackPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 5, 15, 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTextTitle,
          _buildGuildLine,
          _buildButton,
        ],
      ),
    );
  }

  Widget get _buildTextTitle{
    return const Center(
      child: SizedBox(
        width: 230,
        child: Center(
          child: TextWidget(
            textAlign: TextAlign.center,
            text: 'Please share your experience and make any suggestion for the following questions:',
          ),
        ),
      ),
    );
  }
  Widget get _buildGuildLine{
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: TextWidget(
              text: '1. How would you rate your experience with us?',
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const TextWidget(text: 'Very dissatisfied'),
                const Space(width: 3),
                SizedBox(
                  width: 85,
                  height: 20,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index){
                      return _buildRatingNumber(index + 1);
                    },
                  ),
                ),
                const Space(width: 3),
                const TextWidget(text: 'Very satisfied'),
              ],
            ),
          ),
          const Space(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(
                flex: -1,
                child: TextWidget(
                  text: '2. ',
                ),
              ),
              Expanded(
                child: TextWidget(
                  text: 'What ares do you wants us to improve further in order to service you better?',
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: const TextFieldWidget(
              inputType: TextInputType.text,
              height: 80,
              maxLine: 5,
              contentPadding: EdgeInsets.all(10),
            ),
          ),
        ],
      ),
    );
  }
  Widget get _buildButton{
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: ButtonWidget(
        onPressed: () => print("Button is Clicked"), // ignore: avoid_print
        width: 250,
        borderRadius: 25.0,
        child: const TextWidget(
          isTitle: true,
          text: 'Submit',
          color: white,
        ),
      ),
    );
  }

  Widget _buildRatingNumber(int index){
    return Container(
      width: 15,
      height: 15,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        border: Border.all(color: silver, width: 1),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: TextWidget(text: '$index', size: 9,),
      ),
    );
  }
}

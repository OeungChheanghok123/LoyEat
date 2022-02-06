import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/icon_widget.dart';
import 'package:loy_eat/widgets/layout_widget/space.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';

class InviteFriendPageWidget extends StatefulWidget {
  const InviteFriendPageWidget({Key? key}) : super(key: key);

  @override
  _InviteFriendPageWidgetState createState() => _InviteFriendPageWidgetState();
}

class _InviteFriendPageWidgetState extends State<InviteFriendPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 5, 15, 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTotalPoints,
          _buildUnderLine,
          _buildGuildLine,
        ],
      ),
    );
  }

  Widget get _buildTotalPoints{
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextWidget(text: 'Total Points'),
          const Space(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              TextWidget(
                isTitle: true,
                text: '100p',
                color: rabbit,
              ),
              Space(),
              IconWidget(icon: Icons.loyalty_outlined),
            ],
          ),
          const Space(height: 10),
        ],
      ),
    );
  }
  Widget get _buildUnderLine{
    return Container(
      width: double.infinity,
      height: 1.5,
      color: silver,
      margin: const EdgeInsets.symmetric(vertical: 20),
    );
  }
  Widget get _buildGuildLine{
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const TextWidget(
          text: 'Invite a friend, Get 5 points with terms:',
          fontWeight: FontWeight.bold,
        ),
        const Space(height: 10),
        Container(
          margin: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const Space(height: 10),
              const TextWidget(text: '1. Download a Driver App'),
              const Space(height: 10),
              Row(
                children: const [
                  TextWidget(text: '2. Apply for a driver by using your referral code: '),
                  TextWidget(text: '4323', fontWeight: FontWeight.bold, color: carrot),
                ],
              ),
              const Space(height: 10),
              const TextWidget(text: '3. The driver is approved and staring the driving job.'),
            ],
          ),
        )
      ],
    );
  }
}

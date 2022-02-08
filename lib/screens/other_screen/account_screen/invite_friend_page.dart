import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/button_widget.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/icon_widget.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';
import 'package:loy_eat/widgets/page_widget/invite_friend_page_widget.dart';

class InviteFriendPage extends StatefulWidget {
  const InviteFriendPage({Key? key}) : super(key: key);

  @override
  _InviteFriendPageState createState() => _InviteFriendPageState();
}

class _InviteFriendPageState extends State<InviteFriendPage> {
  String titleText = 'Invite Friends to Earn Points';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: white,
        appBar: _buildAppBar(),
        body: const InviteFriendPageWidget(),
        bottomSheet: _buildButton,
      ),
    );
  }

  AppBar _buildAppBar(){
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: const IconWidget(
          icon: Icons.arrow_back_ios,
          color: black,
          size: 24,
        ),
      ),
      titleSpacing: 0,
      centerTitle: true,
      title: TextWidget(
        text: titleText,
        size: 16,
        fontWeight: FontWeight.bold,
        color: black,
      ),
    );
  }
  Widget get _buildButton{
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonWidget(
            onPressed: () => print ('Share Link button is click'), // ignore_for_file: avoid_print
            child: const TextWidget(text: 'Share Your Link', color: white,),
          ),
          ButtonWidget(
            onPressed: () => print ('Scan QR Code button is clicked'),
            child: const TextWidget(text: 'Scan QR Code', color: white,),
          ),
        ],
      ),
    );
  }
}

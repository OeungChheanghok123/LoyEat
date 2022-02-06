import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/button_widget.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/icon_widget.dart';
import 'package:loy_eat/widgets/layout_widget/space.dart';
import 'package:loy_eat/screens/other_screen/account_screen/edit_profile_page.dart';
import 'package:loy_eat/screens/other_screen/account_screen/feedback_page.dart';
import 'package:loy_eat/screens/other_screen/account_screen/invite_friend_page.dart';
import 'package:loy_eat/screens/other_screen/account_screen/language_page.dart';
import 'package:loy_eat/screens/other_screen/account_screen/rating_score_page.dart';
import 'package:loy_eat/screens/other_screen/account_screen/support_page.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';

class AccountPageWidget extends StatefulWidget {
  const AccountPageWidget({Key? key}) : super(key: key);

  @override
  _AccountPageWidgetState createState() => _AccountPageWidgetState();
}

class _AccountPageWidgetState extends State<AccountPageWidget> {
  String driverName = 'Plang Phalla';
  String phoneNumber = '093 807 808';

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
            _buildDriverDetail,
            _buildMenu,
            _buildButtonLogout,
          ],
        ),
      ),
    );
  }

  Widget get _buildDriverDetail{
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(35, 20, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: rabbit,
                    borderRadius: BorderRadius.circular(50),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/image/driver_profile.png'),
                    ),
                  ),
                ),
                const Space(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget> [
                    IconWidget(icon: Icons.image_rounded, size: 16, color: silver),
                    Space(),
                    IconWidget(icon: Icons.photo_camera_rounded, size: 16, color: silver),
                  ],
                ),
              ],
            ),
            const Space(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                TextWidget(isTitle: true, text: driverName),
                const Space(height: 10),
                TextWidget(text: phoneNumber, color: silver),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget get _buildMenu{
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 25, 20, 30),
      child: Column(
        children: [
          _buildMenuItem(Icons.person_rounded, 'Edit Profile', const EditProfilePage()),
          _buildMenuItem(Icons.reviews_rounded, 'Rating Score', const RatingScorePage()),
          _buildMenuItem(Icons.loyalty_outlined, 'Invite Friends to Earn Points', const InviteFriendPage()),
          _buildMenuItem(Icons.help_outlined, 'Need a Support', const SupportPage()),
          _buildMenuItem(Icons.rate_review_outlined, 'Feedback Us', const FeedbackPage()),
          _buildMenuItem(Icons.language_outlined, 'Language', const LanguagePage()),
        ],
      ),
    );
  }
  Widget get _buildButtonLogout{
    return Container(
      margin: const EdgeInsets.fromLTRB(40, 20, 40, 0),
      child: ButtonWidget(
        onPressed: (){
          exit(0);
        },
        width: MediaQuery.of(context).size.width,
        color: lightGray,
        child: const TextWidget(
          isTitle: true,
          text: 'Logout',
          color: rabbit,
        ),
      ),
    );
  }
  
  Widget _buildMenuItem(IconData leadingIcon, String text, Widget page){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => page)),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconWidget(icon: leadingIcon, size: 25),
                    const Space(width: 15),
                    TextWidget(text: text),
                  ],
                ),
                const IconWidget(icon: Icons.arrow_forward_ios_rounded, size: 22, color: black,),
              ],
            ),
          ),
        ),
        const Space(),
        Container(
          color: silver,
          height: 1,
        ),
        const Space(width: 15),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/space.dart';
import 'package:loy_eat/screens/other_screen/account_screen/edit_profile_page.dart';
import 'package:loy_eat/screens/other_screen/account_screen/feedback_page.dart';
import 'package:loy_eat/screens/other_screen/account_screen/invite_friend_page.dart';
import 'package:loy_eat/screens/other_screen/account_screen/language_page.dart';
import 'package:loy_eat/screens/other_screen/account_screen/rating_score_page.dart';
import 'package:loy_eat/screens/other_screen/account_screen/support_page.dart';

class AccountPageWidget extends StatefulWidget {
  const AccountPageWidget({Key? key}) : super(key: key);

  @override
  _AccountPageWidgetState createState() => _AccountPageWidgetState();
}

class _AccountPageWidgetState extends State<AccountPageWidget> {
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
            const Space(width: 15),
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
        padding: const EdgeInsets.fromLTRB(25, 10, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildIcon(Icons.account_circle_rounded, 60, rabbit),
                Row(
                  children: [
                    _buildIcon(Icons.image_rounded, 16, silver),
                    const Space(),
                    _buildIcon(Icons.photo_camera_rounded, 16, silver),
                  ],
                )
              ],
            ),
            const Space(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildText('Plang Phalla', 14, black, FontWeight.bold),
                const Space(width: 10),
                _buildText('093 807 808', 12, silver, FontWeight.normal),
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
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: ElevatedButton(
        onPressed: (){},
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(Colors.transparent),
          backgroundColor: MaterialStateProperty.all(lightGray),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        child: const Text('Logout',
          style: TextStyle(
            fontSize: 16,
            color: rabbit,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
  
  Widget _buildIcon(IconData icon, double size, Color color){
    return Icon(icon,
      size: size,
      color: color,
    );
  }
  Widget _buildText(String text, double fontSize, Color fontColor, FontWeight fontWeight){
    return Text(text,
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontWeight: fontWeight,
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
                    Icon(leadingIcon,
                      size: 25,
                      color: rabbit,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(text,
                        style: const TextStyle(
                          fontSize: 14,
                          color: black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                const Icon(Icons.arrow_forward_ios_rounded,
                  size: 22,
                  color: black,
                ),
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
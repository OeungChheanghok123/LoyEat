import 'package:flutter/material.dart';
import 'package:loy_eat/controller/color.dart';

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
            space(15, 0),
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
                    space(3, 0),
                    _buildIcon(Icons.photo_camera_rounded, 16, silver),
                  ],
                )
              ],
            ),
            space(20, 0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildText('Plang Phalla', 14, black, FontWeight.bold),
                space(10, 0),
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
          _buildMenuItem(Icons.person_rounded, 'Edit Profile'),
          _buildMenuItem(Icons.reviews_rounded, 'Rating Score'),
          _buildMenuItem(Icons.loyalty_outlined, 'Invite Friends to Earn Points'),
          _buildMenuItem(Icons.help_outlined, 'Need a Support'),
          _buildMenuItem(Icons.rate_review_outlined, 'Feedback Us'),
          _buildMenuItem(Icons.language_outlined, 'Language'),
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
  Widget _buildMenuItem(IconData leadingIcon, String text){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
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
        space(5, 0),
        Container(
          color: silver,
          height: 1,
        ),
        space(15, 0),
      ],
    );
  }
}
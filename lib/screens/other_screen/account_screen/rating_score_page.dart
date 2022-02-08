import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/icon_widget.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';
import 'package:loy_eat/widgets/page_widget/rating_score_page_widget.dart';

class RatingScorePage extends StatefulWidget {
  const RatingScorePage({Key? key}) : super(key: key);

  @override
  _RatingScorePageState createState() => _RatingScorePageState();
}

class _RatingScorePageState extends State<RatingScorePage> {
  String titleText = 'Rating Score';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: white,
        appBar: _buildAppBar(),
        body: const RatingScorePageWidget(),
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
}

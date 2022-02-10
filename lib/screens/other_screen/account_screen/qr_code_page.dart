import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/icon_widget.dart';
import 'package:loy_eat/widgets/layout_widget/title_appbar_widget.dart';
import 'package:loy_eat/widgets/page_widget/qr_code_page_widget.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({Key? key}) : super(key: key);

  @override
  _QRCodePageState createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  String titleText = 'Invite Friends to Earn Points';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: white,
        appBar: _buildAppBar(),
        body: const QRCodePageWidget(),
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
      title: TitleAppBarWidget(text: titleText),
    );
  }
}

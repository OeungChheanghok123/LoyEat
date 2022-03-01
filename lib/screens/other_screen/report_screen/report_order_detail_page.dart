import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/icon_widget.dart';
import 'package:loy_eat/widgets/layout_widget/title_appbar_widget.dart';
import 'package:loy_eat/widgets/page_widget/report_order_detail_page_widget.dart';

class ReportOrderDetailPage extends StatefulWidget {
  const ReportOrderDetailPage({Key? key}) : super(key: key);

  @override
  _ReportOrderDetailPageState createState() => _ReportOrderDetailPageState();
}

class _ReportOrderDetailPageState extends State<ReportOrderDetailPage> {
  String titleText = 'Order ID: 123456';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: white,
        appBar: _buildAppBar(),
        body: const ReportOrderDetailPageWidget(),
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

import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';

class ReportOrderDetailPageWidget extends StatefulWidget {
  const ReportOrderDetailPageWidget({Key? key}) : super(key: key);

  @override
  _ReportOrderDetailPageWidgetState createState() => _ReportOrderDetailPageWidgetState();
}

class _ReportOrderDetailPageWidgetState extends State<ReportOrderDetailPageWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const ClampingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildProfileCustomer,
          Container(
            margin: const EdgeInsets.fromLTRB(15, 5, 15, 15),
            child: _buildOrderDetailItem,
          ),
        ],
      ),
    );
  }

  Widget get _buildProfileCustomer{
    return Container(
      color: lightGray,
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10,  vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 0,
            child: Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                color: rabbit,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: rabbit, width: 2),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/driver_profile.png'),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: none,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  TextWidget(
                    text: "Moun Sovongdy",
                  ),
                  TextWidget(
                    text: "#23, St. 344, Sangkat Dangkor Khan Dangkor",
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: carrot,
            ),
          ),
        ],
      ),
    );
  }
  Widget get _buildOrderDetailItem{
    return Container();
  }
}

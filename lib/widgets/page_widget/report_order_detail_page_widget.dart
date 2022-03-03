import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/icon_widget.dart';
import 'package:loy_eat/widgets/layout_widget/space.dart';
import 'package:loy_eat/widgets/layout_widget/text_field_widget.dart';
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
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 15),
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
                    text: "#23, St. 344, Sangkat Dangkor Khan Dangkor Phnom Penh",
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Center(
              child: Stack(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                    decoration: BoxDecoration(
                      color: rabbit,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const IconWidget(icon: Icons.call, color: white, size: 24),
                  ),
                  Positioned(
                    top: 0,
                    right: 18,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: const DecorationImage(
                          image: AssetImage('assets/image/smart_icon.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
  Widget get _buildOrderDetailItem{
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextWidget(text: '5 items - Collect money (exclude tip)'),
            Container(
              color: rabbit,
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: const TextWidget(text: '\$19.00', color: white,),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 2,
          color: silver,
          margin: const EdgeInsets.symmetric(vertical: 10),
        ),
        const TextWidget(text: "Remarks:", color: text,),
        const TextFieldWidget(inputType: TextInputType.text, height: 40),
        const TextWidget(text: "Items:", color: rabbit, fontWeight: FontWeight.bold,),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                          flex: 0,
                          child: TextWidget(text: '1. ',)
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Expanded(
                              flex: 0,
                              child: TextWidget(text: 'Product A',)
                          ),
                          Space(height: 3),
                          Expanded(
                            flex: 0,
                            child: TextWidget(text: "1 x \$3.00", size: 10, color: silver, fontStyle: FontStyle.italic,),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const TextWidget(text: '\$3.00'),
                ],
              ),
              const Space(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: const DottedLine(
                  dashLength: 2,
                  lineThickness: 2,
                  dashColor: silver,
                ),
              ),

            ],
          )
        ),
      ],
    );
  }
}

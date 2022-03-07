import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/button_widget.dart';
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

  List<String> productItems = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K'];
  int orderItemCount = 3;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const ClampingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildProfileCustomer,
          _buildOrderDetailItems,
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
  Widget get _buildOrderDetailItems{
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textAndPriceWithColor('$orderItemCount items - Collect money (exclude tip)', '19.00', FontWeight.normal),
          horizontalLine,
          buildTitle('Remarks:', text, FontWeight.normal),
          buildTextField(TextInputType.text, 40),
          buildTitle('Items:', rabbit, FontWeight.bold),
          orderItems,
          horizontalLine,
          detailReport,
          textAndPriceWithColor('Your Earning ', '5.00', FontWeight.bold),
          buttonStatus('Delivered successfully to Sovongdy', rabbit),
        ],
      ),
    );
  }
  Widget get orderItems{
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: orderItemCount,
        itemBuilder: (BuildContext context, int index){
          return Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 0,
                              child: TextWidget(text: '${index+1}. ',)
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 0,
                                  child: TextWidget(text: 'Product ${productItems[index]}',)
                              ),
                              const Space(height: 3),
                              const Expanded(
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
                  space(5),
                  index + 1 == orderItemCount ? Container() : horizontalDottedLine,
                ],
              )
          );
        },
      ),
    );
  }
  Widget get detailReport{
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textAndPrice('Subtotal', '15.00', FontWeight.normal),
        textAndPrice('Discount', '0.00', FontWeight.normal),
        textAndPrice('VAT', '0.00', FontWeight.normal),
        horizontalDottedLine,
        textAndPrice('Net delivery fee', '4.00', FontWeight.bold),
        textAndPrice('Tip', '1.00', FontWeight.bold),
        textAndPrice('Bonus', '0.00', FontWeight.bold),
        horizontalLine,
        textAndPrice('Total', '20.00', FontWeight.normal),
        space(10),
      ],
    );
  }
  Widget get horizontalLine{
    return Container(
      width: double.infinity,
      height: 2,
      color: silver,
      margin: const EdgeInsets.symmetric(vertical: 5),
    );
  }
  Widget get horizontalDottedLine{
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: const DottedLine(
        dashLength: 2,
        lineThickness: 2,
        dashColor: silver,
      ),
    );
  }

  Widget space(double size){
    return Space(height: size);
  }
  Widget textAndPriceWithColor(String text, String price, FontWeight fontWeight){
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(text: text, fontWeight: fontWeight),
          Container(
            color: rabbit,
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: TextWidget(text: '\$$price', color: white, fontWeight: fontWeight),
          ),
        ],
      ),
    );
  }
  Widget textAndPrice(String text, String price, FontWeight fontWeight){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(text: text, fontWeight: fontWeight,),
        TextWidget(text: '\$$price', fontWeight: fontWeight,),
      ],
    );
  }
  Widget buildTitle(String title, Color color, FontWeight fontWeight){
    return TextWidget(text: title, color: color, fontWeight: fontWeight);
  }
  Widget buildTextField(TextInputType textInputType, double height){
    return TextFieldWidget(inputType: textInputType, height: height);
  }
  Widget buttonStatus(String text, Color color){
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ButtonWidget(
        onPressed: () => print('button is clicked'), // ignore: avoid_print
        width: double.infinity,
        height: 45,
        color: color,
        child: TextWidget(text: text, color: white, size: 14, fontWeight: FontWeight.w500,),
      ),
    );
  }
}
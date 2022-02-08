import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/space.dart';
import 'package:loy_eat/widgets/layout_widget/svg_picture_widget.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';

class SupportPageWidget extends StatefulWidget {
  const SupportPageWidget({Key? key}) : super(key: key);

  @override
  _SupportPageWidgetState createState() => _SupportPageWidgetState();
}

class _SupportPageWidgetState extends State<SupportPageWidget> {

  String smartImage = 'assets/image/smart_axiata.svg';
  String cellcardImage = 'assets/image/cellcard.svg';
  String smartNumber = '093 88 44 00';
  String cellcardNumber = '085 90 33 00';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.fromLTRB(15, 5, 15, 15),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildPhoneNumber,
          ],
        ),
      ),
    );
  }

  Widget get _buildPhoneNumber{
    return Card(
      color: white,
      elevation: 10,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TextWidget(isTitle: true, text: 'Call Now'),
            const Space(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 25,
                  height: 20,
                  child: SvgPictureWidget(
                    imageString: smartImage,
                    label: 'Smart Number: 093 88 44 00',
                  ),
                ),
                const Space(width: 10),
                TextWidget(text: smartNumber, size: 14),
              ],
            ),
            const Space(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 25,
                  height: 20,
                  child: SvgPictureWidget(
                    imageString: cellcardImage,
                    label: 'Cellcard Number: 085 90 33 00',
                  ),
                ),
                const Space(width: 10),
                TextWidget(text: cellcardNumber, size: 14),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

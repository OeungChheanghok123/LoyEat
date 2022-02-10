import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/space.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodePageWidget extends StatefulWidget {
  const QRCodePageWidget({Key? key}) : super(key: key);

  @override
  _QRCodePageWidgetState createState() => _QRCodePageWidgetState();
}

class _QRCodePageWidgetState extends State<QRCodePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 5, 15, 15),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTitleAndDetail,
            _buildQRCode,
          ],
        ),
      ),
    );
  }

  Widget get _buildTitleAndDetail{
    return Column(
      children: const [
        TextWidget(text: 'Scan QR Code', isTitle: true),
        Space(height: 10),
        SizedBox(
          width: 200,
          child: TextWidget(
            textAlign: TextAlign.center,
            text: 'Ask your friend to open smart phone camera and shoot it!',
          ),
        ),
      ],
    );
  }
  Widget get _buildQRCode{
    return QrImage(
      data: 'This is a simple QR code',
      version: QrVersions.auto,
      size: 320,
      gapless: false,
    );
  }
}
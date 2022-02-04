import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/button_widget.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/image_icon_widget.dart';
import 'package:loy_eat/widgets/layout_widget/radio_button_widget.dart';
import 'package:loy_eat/widgets/layout_widget/space.dart';
import 'package:loy_eat/widgets/layout_widget/text_field_widget.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';

class EditProfilePageWidget extends StatefulWidget {
  const EditProfilePageWidget({Key? key}) : super(key: key);

  @override
  _EditProfilePageWidgetState createState() => _EditProfilePageWidgetState();
}

class _EditProfilePageWidgetState extends State<EditProfilePageWidget> {

  int _radioValue = 0;
  String hintPhoneNumber = '093 807 808';

  bool isSelectedBike = true;
  bool isSelectedMotor = false;
  bool isSelectedRickshaw = false;

  bool isSelectMorning = true;
  bool isSelectAfternoon = false;
  bool isSelectEvening = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: const EdgeInsets.fromLTRB(15, 5, 15, 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDriverName,
            _buildDriverGenderAndBirthYear,
            _buildDriverMobilePhone,
            _buildDriverVehicle,
            // _buildDriverLive,
            _buildDriverSchedule,
            // _buildDriverIDCard,
            // _buildDriverReferral,
            // _buildSubmitButton,
          ],
        ),
      ),
    );
  }

  Widget get _buildDriverName{
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget> [
        TextWidget(
          isTitle: true,
          text: 'Name:',
        ),
        TextFieldWidget(
          height: 35,
          inputType: TextInputType.text,
        ),
        Space(height: 10),
      ],
    );
  }
  Widget get _buildDriverGenderAndBirthYear{
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(
              isTitle: true,
              text: 'Sex:',
            ),
            Row(
              children: [
                _buildRadioButton(0, 'Male'),
                const Space(width: 10),
                _buildRadioButton(1, 'Female'),
              ],
            ),
            const Space(height: 10),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            TextWidget(
              isTitle: true,
              text: 'Birth Year:',
            ),
            SizedBox(
              width: 100,
              height: 45,
              child: TextFieldWidget(
                inputType: TextInputType.datetime,
                height: 50,
                hintText: '2000',
                textAlign: TextAlign.center,
                contentPaddingLeft: 0,
              ),
            ),
            Space(height: 10),
          ],
        ),
      ],
    );
  }
  Widget get _buildDriverMobilePhone{
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const TextWidget(
          isTitle: true,
          text: 'Mobile Phone:',
        ),
        TextFieldWidget(
          height: 35,
          inputType: TextInputType.number,
          hintText: hintPhoneNumber,
          hintColor: silver,
          isSuffixIcon: true,
          suffixIcon: const Icon(Icons.check_circle, color: rabbit),
        ),
        const Space(height: 10),
      ],
    );
  }
  Widget get _buildDriverVehicle{
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const TextWidget(
          isTitle: true,
          text: 'Choose your vehicle:',
        ),
        const Space(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildVehicleButton(0, 'assets/image/bike_icon.png', 'Bike', isSelectedBike ? rabbit : platinum, isSelectedBike ? rabbit : white),
            _buildVehicleButton(1, 'assets/image/motor_icon.png', 'Motor', isSelectedMotor ? rabbit : platinum, isSelectedMotor ? rabbit : white),
            _buildVehicleButton(2, 'assets/image/rickshaw_icon.png', 'Rickshaw', isSelectedRickshaw ? rabbit : platinum, isSelectedRickshaw ? rabbit : white),
          ],
        ),
        const Space(height: 10),
      ],
    );
  }
  Widget get _buildDriverSchedule{
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const TextWidget(
          isTitle: true,
          text: 'Your time available:',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildButtonSchedule(0, 'Morning', isSelectMorning ? white : black, isSelectMorning ? rabbit : white, isSelectMorning ? none : silver),
            _buildButtonSchedule(1, 'Afternoon', isSelectAfternoon ? white : black, isSelectAfternoon ? rabbit : white, isSelectAfternoon ? none : silver),
            _buildButtonSchedule(2, 'Evening', isSelectEvening ? white : black, isSelectEvening ? rabbit : white, isSelectEvening ? none : silver),
          ],
        ),
        const Space(height: 10),
      ],
    );
  }


  Widget _buildRadioButton(int index, String text) => InkWell(
    splashColor: none,
    onTap: () => setState(() => _radioValue = index ),
    child: Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RadioButtonWidget(
            index: index,
            groupValue: _radioValue,
            onChanged: (newValue) => setState(() => _radioValue = newValue ),
          ),
          const Space(width: 8),
          TextWidget(text: text),
        ],
      ),
    ),
  );
  Widget _buildVehicleButton(int index, String image, String text, Color borderColor, Color backgroundColor) => InkWell(
    splashColor: none,
    onTap: (){
      setState(() {
        if (index == 0) {
          isSelectedBike = true;
          isSelectedMotor = false;
          isSelectedRickshaw = false;
        }
        if (index == 1) {
          isSelectedMotor = true;
          isSelectedBike = false;
          isSelectedRickshaw = false;
        }
        if(index == 2) {
          isSelectedRickshaw = true;
          isSelectedBike = false;
          isSelectedMotor = false;
        }
      });
    },
    child: Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 10, 5),
      child: Row (
        children: [
          ImageIconWidget(
            image: image,
            borderColor: borderColor,
            backgroundColor: backgroundColor,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10.0),
            child: TextWidget(
              text: text,
            ),
          ),
        ],
      ),
    ),
  );
  Widget _buildButtonSchedule(int index, String text, Color textColor, Color buttonColor, Color borderColor) => Container(
    width: 100,
    height: 35,
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: ButtonWidget(
      onPressed: (){
        setState(() {
          if (index == 0) {
            isSelectMorning = true;
            isSelectAfternoon = false;
            isSelectEvening = false;
          }
          if (index == 1) {
            isSelectAfternoon = true;
            isSelectMorning = false;
            isSelectEvening = false;
          }
          if(index == 2) {
            isSelectEvening = true;
            isSelectMorning = false;
            isSelectAfternoon = false;
          }
        });
      },
      color: buttonColor,
      borderSide: BorderSide(
        color: borderColor,
        width: 1,
      ),
      child: TextWidget(
        text: text,
        color: textColor,
      ),
    ),
  );
}

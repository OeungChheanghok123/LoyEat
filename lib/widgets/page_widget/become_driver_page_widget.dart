import 'package:flutter/material.dart';
import 'package:loy_eat/models/location.dart';
import 'package:loy_eat/screens/flash_screen/instruction_page.dart';
import 'package:loy_eat/widgets/layout_widget/button_widget.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/image_icon_widget.dart';
import 'package:loy_eat/widgets/layout_widget/icon_widget.dart';
import 'package:loy_eat/widgets/layout_widget/radio_button_widget.dart';
import 'package:loy_eat/widgets/layout_widget/space.dart';
import 'package:loy_eat/widgets/layout_widget/text_field_widget.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';

class BecomeDriverPageWidget extends StatefulWidget {
  const BecomeDriverPageWidget({Key? key}) : super(key: key);

  @override
  _BecomeDriverPageWidgetState createState() => _BecomeDriverPageWidgetState();
}

class _BecomeDriverPageWidgetState extends State<BecomeDriverPageWidget> {

  int _radioValue = 0;
  String? _dropDownDistrictValue;
  String? _dropDownCommuneValue;

  bool isSelectedBike = false;
  bool isSelectedMotor = false;
  bool isSelectedRickshaw = false;

  bool isSelectMorning = false;
  bool isSelectAfternoon = false;
  bool isSelectEvening = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Space(height: 20),
            _buildDriverName,
            _buildDriverGenderAndBirthYear,
            _buildDriverMobilePhone,
            _buildDriverVehicle,
            _buildDriverLive,
            _buildDriverSchedule,
            _buildDriverIDCard,
            _buildDriverReferral,
            _buildSubmitButton,
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
      children: const <Widget>[
        TextWidget(
          isTitle: true,
          text: 'Mobile Phone:',
        ),
        TextFieldWidget(
          height: 35,
          inputType: TextInputType.number,
          hintText: 'Enter your phone number',
          hintColor: silver,
        ),
        Space(height: 10),
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
  Widget get _buildDriverLive{
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const TextWidget(
          isTitle: true,
          text: 'Where do you live?',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildDropdownButton(0, 'Districts', menuDistrictItems),
            _buildDropdownButton(1, 'Communes', menuCommuneItems),
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
  Widget get _buildDriverIDCard{
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children:  <Widget>[
        const TextWidget(
          isTitle: true,
          text: 'Take your ID card photo:',
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ButtonWidget(
            width: MediaQuery.of(context).size.width,
            height: 100,
            onPressed: () => print('take photo is clicked'),
            color: platinum,
            child: const IconWidget(
              icon: Icons.photo_camera,
              size: 48,
            ),
          ),
        ),
        const Space(),
      ],
    );
  }
  Widget get _buildDriverReferral{
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const <Widget>[
        TextWidget(
          isTitle: true,
          text: 'Referral code if have:',
        ),
        SizedBox(
          width: 120,
          height: 50,
          child: TextFieldWidget(
            height: 50,
            inputType: TextInputType.number,
            textAlign: TextAlign.center,
            contentPaddingLeft: 0,
            hintText: 'Enter code',
          ),
        ),
      ],
    );
  }
  Widget get _buildSubmitButton{
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.fromLTRB(25, 15, 25, 0),
      child:  ButtonWidget(
        height: 40,
        onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InstructionPage())),
        borderRadius: 25,
        child: const TextWidget(
          isTitle: true,
          text: 'Submit',
          color: white,
        ),
      ),
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
  Widget _buildDropdownButton(int index, String hintText, List<String> menuItems){
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: white,
        border: Border.all(color: silver, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton<String>(
        value: index == 0 ? _dropDownDistrictValue : _dropDownCommuneValue,
        hint: TextWidget(text: hintText),
        items: menuItems.map((String value) =>
          DropdownMenuItem<String>(
            value: value,
            child: TextWidget(text: value),
          ),
        ).toList(),
        borderRadius: BorderRadius.circular(5),
        dropdownColor: white,
        alignment: AlignmentDirectional.center,
        isDense: true,
        itemHeight: null,
        menuMaxHeight: 300,
        underline: Container(),
        onChanged: (String? newValue){
          if (newValue != null){
            if (index == 0){
              setState(() {
                _dropDownDistrictValue = newValue;
              });
            }
            else {
              setState(() {
                _dropDownCommuneValue = newValue;
              });
            }
          }
        },
      ),
    );
  }
}
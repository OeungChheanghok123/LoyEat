import 'package:flutter/material.dart';
import 'package:loy_eat/controller/color.dart';

class BecomeDriverWidget extends StatefulWidget {
  const BecomeDriverWidget({Key? key}) : super(key: key);

  @override
  _BecomeDriverWidgetState createState() => _BecomeDriverWidgetState();
}

class _BecomeDriverWidgetState extends State<BecomeDriverWidget> {

  int _radioValue = 0;
  String? _dropDownDistrictValue;
  String? _dropDownCommuneValue;

  static const menuDistrictItems = <String>[
    'Chamkar Mon', 'Daun Penh', 'Prampir Makara', 'Tuol Kouk', 'Dangkao',
    'Mean Chey', 'Russey Keo', 'Sen Sok', 'Pou Senchey', 'Chroy Changvar', 'Prek Pnov',
    'Chbar Ampov', 'Boeng Keng Kang', 'Kamboul',
  ];

  static const menuCommuneItems = <String>[
    'Chamkar Mon', 'Daun Penh', 'Prampir Makara', 'Tuol Kouk', 'Dangkao',
    'Mean Chey', 'Russey Keo', 'Sen Sok', 'Pou Senchey', 'Chroy Changvar', 'Prek Pnov',
    'Chbar Ampov', 'Boeng Keng Kang', 'Kamboul',
  ];

  final List<DropdownMenuItem<String>> _dropDownDistrictMenuItems = menuDistrictItems.map((String value) =>
      DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      ),
  ).toList();

  final List<DropdownMenuItem<String>> _dropDownCommuneMenuItems = menuCommuneItems.map((String value) =>
      DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      ),
  ).toList();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDriverName,
            _buildDriverGenderAndBirthYear,
            _buildDriverMobilePhone,
            _buildDriverVehicle,
            _buildDriverLive,
            _buildDriverTime,
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
      children: <Widget> [
        _buildStringTitle('Name:'),
        _buildTextField(TextInputType.text, TextAlign.start, const EdgeInsets.only(left: 10), ''),
        const SizedBox(height: 10),
      ],
    );
  }
  Widget get _buildDriverGenderAndBirthYear{
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStringTitle('Sex:'),
            Row(
              children: [
                _buildRadioButton(0, 'Male'),
                const SizedBox(width: 10),
                _buildRadioButton(1, 'Female'),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildStringTitle('Birth Year:'),
            SizedBox(
              width: 100,
              height: 50,
              child: _buildTextField(TextInputType.datetime, TextAlign.center, EdgeInsets.zero, '2000'),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ],
    );
  }
  Widget get _buildDriverMobilePhone{
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildStringTitle('Mobile Phone:'),
        _buildTextField(TextInputType.phone, TextAlign.start, const EdgeInsets.only(left: 10), 'Enter your phone number'),
        const SizedBox(height: 10),
      ],
    );
  }
  Widget get _buildDriverVehicle{
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildStringTitle('Choose your vehicle:'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildVehicleButton('assets/image/bike_icon.png', 'Bike'),
            _buildVehicleButton('assets/image/motor_icon.png', 'Motor'),
            _buildVehicleButton('assets/image/rickshaw_icon.png', 'Rickshaw'),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
  Widget get _buildDriverLive{
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildStringTitle('Where do you live?'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildDistricts('Districts'),
            _buildCommunes('Communes'),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
  Widget get _buildDriverTime{
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildStringTitle('Your time available:'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTime('Morning'),
            _buildTime('Afternoon'),
            _buildTime('Evening'),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
  Widget get _buildDriverIDCard{
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildStringTitle('Take your ID card photo'),
        _buildTakePhoto(),
        const SizedBox(height: 10),
      ],
    );
  }
  Widget get _buildDriverReferral{
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildStringTitle('Referral code if have:'),
        const SizedBox(
          width: 150,
          height: 35,
          child: TextField(
            keyboardType: TextInputType.phone,
            autocorrect: false,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: black,
            ),
            decoration: InputDecoration(
              hintText: 'Enter code',
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget get _buildSubmitButton{
    return Column(
      children: [
        const SizedBox(height: 10),
        _buildButtonSubmit('Submit'),
      ],
    );
  }

  Widget _buildStringTitle(String text) => Text(text,
    style: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: black,
    ),
  );
  Widget _buildTextField(TextInputType inputType, TextAlign textAlign, EdgeInsets contentPadding, String hintText) => Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: TextField(
      keyboardType: inputType,
      textAlign: textAlign,
      autocorrect: false,
      textAlignVertical: TextAlignVertical.center,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: black,
      ),
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
    ),
  );
  Widget _buildRadioButton(int index, String text) => InkWell(
    onTap: () => setState((){ _radioValue = index; }),
    child: Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
      child: Row(
        children: [
          Radio<int>(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            activeColor: rabbit,
            groupValue: _radioValue,
            value: index,
            onChanged: (newValue){
              if (newValue != null){
                setState(() {
                  _radioValue = newValue;
                });
              }
            },
          ),
          Container(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text,
              style: const TextStyle(
                fontSize: 16,
                color: black,
              ),
            ),
          ),
        ],
      ),
    ),
  );
  Widget _buildVehicleButton(String image, String text) => InkWell(
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 2.0, color: rabbit),
            ),
            child: Container(
              margin: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                color: rabbit,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Container(
                margin: const EdgeInsets.all(3.5),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: black,
              ),
            ),
          ),
        ],
      ),
    ),
  );
  Widget _buildDistricts(String text) => Container(
    padding: const EdgeInsets.all(5),
    margin: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      color: white,
      border: Border.all(color: silver, width: 1),
      borderRadius: BorderRadius.circular(5),
    ),
    child: DropdownButton<String>(
      value: _dropDownDistrictValue,
      hint: Text(text),
      items: _dropDownDistrictMenuItems,
      borderRadius: BorderRadius.circular(5),
      isDense: true,
      dropdownColor: white,
      alignment: Alignment.center,
      underline: Container(),
      onChanged: (String? newValue){
        if (newValue != null){
          setState(() => _dropDownDistrictValue = newValue);
        }
      },
    ),
  );
  Widget _buildCommunes(String text) => Container(
    padding: const EdgeInsets.all(5),
    margin: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      color: white,
      border: Border.all(color: silver, width: 1),
      borderRadius: BorderRadius.circular(5),
    ),
    child: DropdownButton<String>(
      value: _dropDownCommuneValue,
      hint: Text(text),
      items: _dropDownCommuneMenuItems,
      borderRadius: BorderRadius.circular(5),
      isDense: true,
      dropdownColor: white,
      alignment: Alignment.center,
      underline: Container(),
      onChanged: (String? newValue){
        if (newValue != null){
          setState(() => _dropDownCommuneValue = newValue);
        }
      },
    ),
  );
  Widget _buildTime(String text) => InkWell(
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: black, width: 1),
        color: rabbit,
      ),
      child: Text(text,
        style: const TextStyle(
          color: black,
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
      ),
    ),
  );
  Widget _buildTakePhoto() => InkWell(
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 100,
      decoration: BoxDecoration(
        color: platinum,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: silver, width: 1),
      ),
      child: const Center(
        child: Icon(Icons.photo_camera,
          size: 48,
          color: rabbit,
        ),
      ),
    ),
  );
  Widget _buildButtonSubmit(String text) => InkWell(
    child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          color: rabbit,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: white,
            ),
          ),
        )
    ),
  );
}

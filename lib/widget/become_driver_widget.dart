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

  bool isSelectedBike = true;
  bool isSelectedMotor = false;
  bool isSelectedRickshaw = false;

  bool isSelectMorning = true;
  bool isSelectAfternoon = false;
  bool isSelectEvening = false;

  static const menuDistrictItems = <String>[
    'Chamkar Mon', 'Daun Penh', 'Prampir Makara', 'Tuol Kouk', 'Dangkao',
    'Mean Chey', 'Russey Keo', 'Sen Sok', 'Pou Senchey', 'Chroy Changvar', 'Prek Pnov',
    'Chbar Ampov', 'Boeng Keng Kang', 'Kamboul'
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
        _buildTextField(const EdgeInsets.symmetric(vertical: 10), TextInputType.text, TextAlign.start, const EdgeInsets.only(left: 10), ''),
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
              width: 80,
              height: 50,
              child: _buildTextField(const EdgeInsets.symmetric(vertical: 10), TextInputType.datetime, TextAlign.center, EdgeInsets.zero, '2000'),
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
        _buildTextField(const EdgeInsets.symmetric(vertical: 10), TextInputType.phone, TextAlign.start, const EdgeInsets.only(left: 10), 'Enter your phone number'),
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
            InkWell(
              splashColor: Colors.transparent,
              onTap: (){
                setState(() {
                  isSelectedBike = true;
                  isSelectedMotor = false;
                  isSelectedRickshaw = false;
                });
              },
              child: _buildVehicleButton('assets/image/bike_icon.png', 'Bike', isSelectedBike ? rabbit : platinum, isSelectedBike ? rabbit : white),
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: (){
                setState(() {
                  isSelectedBike = false;
                  isSelectedMotor = true;
                  isSelectedRickshaw = false;
                });
              },
              child: _buildVehicleButton('assets/image/motor_icon.png', 'Motor', isSelectedMotor ? rabbit : platinum, isSelectedMotor ? rabbit : white),
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: (){
                setState(() {
                  isSelectedBike = false;
                  isSelectedMotor = false;
                  isSelectedRickshaw = true;
                });
              },
              child: _buildVehicleButton('assets/image/rickshaw_icon.png', 'Rickshaw', isSelectedRickshaw ? rabbit : platinum, isSelectedRickshaw ? rabbit : white),
            ),
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
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDistricts('Districts'),
              _buildCommunes('Communes'),
            ],
          ),
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
            InkWell(
              splashColor: Colors.transparent,
              onTap: (){
                setState(() {
                  isSelectMorning = true;
                  isSelectAfternoon = false;
                  isSelectEvening = false;
                });
              },
              child: _buildTime('Morning', isSelectMorning ? rabbit : white),
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: (){
                setState(() {
                  isSelectMorning = false;
                  isSelectAfternoon = true;
                  isSelectEvening = false;
                });
              },
              child: _buildTime('Afternoon', isSelectAfternoon ? rabbit : white),
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: (){
                setState(() {
                  isSelectMorning = false;
                  isSelectAfternoon = false;
                  isSelectEvening = true;
                });
              },
              child: _buildTime('Evening', isSelectEvening ? rabbit : white),
            ),
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
        const SizedBox(height: 5),
      ],
    );
  }
  Widget get _buildDriverReferral{
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildStringTitle('Referral code if have:'),
        SizedBox(
          width: 100,
          height: 30,
          child: _buildTextField(EdgeInsets.zero, TextInputType.number, TextAlign.center, EdgeInsets.zero, 'Enter Code'),
        ),
      ],
    );
  }
  Widget get _buildSubmitButton{
    return Column(
      children: [
        const SizedBox(height: 5),
        _buildButtonSubmit('Submit'),
      ],
    );
  }

  Widget _buildStringTitle(String text) => Text(text,
    style: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: black,
    ),
  );
  Widget _buildTextField(EdgeInsets margin,TextInputType inputType, TextAlign textAlign, EdgeInsets contentPadding, String hintText) => Container(
    margin: margin,
    height: 40,
    child: TextField(
      keyboardType: inputType,
      textAlign: textAlign,
      autocorrect: false,
      textAlignVertical: TextAlignVertical.center,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: black,
      ),
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 12,
        ),
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
                fontSize: 12,
                color: black,
              ),
            ),
          ),
        ],
      ),
    ),
  );
  Widget _buildVehicleButton(String image, String text, Color borderColor, Color color) => Container(
    margin: const EdgeInsets.symmetric(vertical:10, horizontal: 5),
    child: Row (
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 2.5, color: borderColor),
          ),
          child: Container(
            margin: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(100),
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
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: black,
            ),
          ),
        ),
      ],
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
      hint: Text(text,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
      items: _dropDownDistrictMenuItems,
      borderRadius: BorderRadius.circular(5),
      isDense: true,
      dropdownColor: white,
      itemHeight: null,
      menuMaxHeight: 300,
      style: const TextStyle(
        fontSize: 12,
        color: black,
        fontWeight: FontWeight.normal,
      ),
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
      hint: Text(text,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
      items: _dropDownCommuneMenuItems,
      borderRadius: BorderRadius.circular(5),
      isDense: true,
      dropdownColor: white,
      itemHeight: null,
      menuMaxHeight: 300,
      style: const TextStyle(
        fontSize: 12,
        color: black,
        fontWeight: FontWeight.normal,
      ),
      alignment: Alignment.center,
      underline: Container(),
      onChanged: (String? newValue){
        if (newValue != null){
          setState(() => _dropDownCommuneValue = newValue);
        }
      },
    ),
  );
  Widget _buildTime(String text, Color color) => Container(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
    margin: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: silver, width: 1),
      color: color,
    ),
    child: Text(text,
      style: const TextStyle(
        color: black,
        fontWeight: FontWeight.normal,
        fontSize: 12,
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
  Widget _buildButtonSubmit(String text) => Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      margin: const EdgeInsets.fromLTRB(25, 15, 25, 0),
      decoration: BoxDecoration(
        color: rabbit,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: white,
          ),
        ),
      )
  );
}
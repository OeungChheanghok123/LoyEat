import 'package:flutter/material.dart';
import 'package:loy_eat/controller/color.dart';

class BecomeDriver extends StatefulWidget {
  const BecomeDriver({Key? key}) : super(key: key);

  @override
  _BecomeDriverState createState() => _BecomeDriverState();
}

class _BecomeDriverState extends State<BecomeDriver> {

  int _radioVal = 0;
  List<String>listGender = ['M', 'F'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              _buildUserName,

              // Gender and Birth year
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildUserGender,
                    _buildBirthYear,
                  ],
                ),
              ),

              // Mobile Phone
              _buildMobilePhone,

              // Choose your vehicle
              _buildSelectVehicle,

            ],
          ),
        ),
      ),
    );
  }

  Widget get _buildUserName{
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget> [
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text("Name:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: black,
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: TextField(
              keyboardType: TextInputType.text,
              autocorrect: false,
              textAlignVertical: TextAlignVertical.top,
              style: TextStyle(
                fontSize: 16,
                color: black,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 2, left: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _buildUserGender{
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          const Text("Sex:",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),
          SizedBox(
            width: 140,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _radioVal = 0;
                    });
                  },
                  child: SizedBox(
                    width: 60,
                    child: Row(
                      children: [
                        Radio<int>(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                          ),
                          activeColor: rabbit,
                          groupValue: _radioVal,
                          value: 0,
                          onChanged: (value){
                            if (value != null){
                              setState(() {
                                _radioVal = value;
                              });
                            }
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('M',
                            style: TextStyle(
                              fontSize: 18,
                              color: black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _radioVal = 1;
                    });
                  },
                  child: SizedBox(
                    width: 60,
                    child: Row(
                      children: [
                        Radio<int>(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                          ),
                          activeColor: rabbit,
                          groupValue: _radioVal,
                          value: 1,
                          onChanged: (value){
                            if (value != null){
                              setState(() {
                                _radioVal = value;
                              });
                            }
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('F',
                            style: TextStyle(
                              fontSize: 18,
                              color: black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _buildBirthYear{
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          const Text("Birth Year:",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),
          Container(
            width: 100,
            height: 50,
            padding: const EdgeInsets.all(5),
            child: const TextField(
              keyboardType: TextInputType.datetime,
              autocorrect: false,
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.top,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: black,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _buildMobilePhone{
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget> [
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text("Mobile Phone:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: black,
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: TextField(
              keyboardType: TextInputType.phone,
              autocorrect: false,
              textAlignVertical: TextAlignVertical.top,
              style: TextStyle(
                fontSize: 16,
                color: black,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 2, left: 10),
                hintText: 'Enter your phone number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _buildSelectVehicle{
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          const Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text("Choose your vehicle:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: black,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // bike
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
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
                        margin: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/image/bike_icon.png',),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text('Bike',
                      style: TextStyle(
                        fontSize: 16,
                        color: black,
                      ),
                    ),
                  ),
                ],
              ),

              // motor
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 2.0, color: silver),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/image/motor_icon.png',),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text('Motor',
                      style: TextStyle(
                        fontSize: 16,
                        color: black,
                      ),
                    ),
                  ),
                ],
              ),

              // rickshaw
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 2.0, color: silver),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/image/rickshaw_icon.png',),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text('Rickshaw',
                      style: TextStyle(
                        fontSize: 16,
                        color: black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

}

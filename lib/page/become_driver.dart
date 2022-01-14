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
            children: [
              // Name
              _buildUserName(),

              // Gender and Birth year
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildUserGender(),
                    _buildBirthYear(),
                  ],
                ),
              ),

              // Mobile Phone
              _buildMobilePhone(),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserName(){
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

  Widget _buildUserGender(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text("Sex:",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [0, 1].map((int index) => SizedBox(
            width: 120,
            child: Transform.scale(
              scale: 1.2,
              child: RadioListTile<int>(
                value: index,
                groupValue: _radioVal,
                title: Text(listGender[index],
                  style: const TextStyle(
                    fontSize: 16,
                    color: black,
                  ),
                ),
                activeColor: rabbit,
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _radioVal = value);}
                  },
                ),
            ),
            ),
          ).toList(),
        ),
      ],
    );
  }

  Widget _buildBirthYear(){
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

  Widget _buildMobilePhone(){
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
}

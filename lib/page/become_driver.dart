import 'package:flutter/material.dart';
import 'package:loy_eat/controller/color.dart';

class BecomeDriver extends StatefulWidget {
  const BecomeDriver({Key? key}) : super(key: key);

  @override
  _BecomeDriverState createState() => _BecomeDriverState();
}

enum Gender { M, F }

class _BecomeDriverState extends State<BecomeDriver> {

  int radioVal = 0;
  Gender? _sex = Gender.M;

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget> [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text("Name:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: black,
                        ),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      autocorrect: false,
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Text("Sex:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Text("Birth Year:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListTile(
                            title: const Text('M'),
                            leading: Radio<Gender>(
                              value: Gender.M,
                              groupValue: _sex,
                              onChanged: (Gender? value) {
                                setState(() {
                                  _sex = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('F'),
                            leading: Radio<Gender>(
                              value: Gender.F,
                              groupValue: _sex,
                              onChanged: (Gender? value) {
                                setState(() {
                                  _sex = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

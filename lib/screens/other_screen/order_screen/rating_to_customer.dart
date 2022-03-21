import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/button_widget.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/widgets/layout_widget/icon_widget.dart';
import 'package:loy_eat/widgets/layout_widget/space.dart';
import 'package:loy_eat/widgets/layout_widget/text_field_widget.dart';
import 'package:loy_eat/widgets/layout_widget/text_widget.dart';

class RatingToCustomer extends StatelessWidget {
  const RatingToCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIconBackColor(60, rabbit, Icons.check, 40),
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 10),
            child: const TextWidget(text: 'Thank You', size: 14, fontWeight: FontWeight.bold,),
          ),
          const TextWidget(text: 'Your trip is now delivered!'),
          const Space(height: 20),
          Stack(
            children: [
              SizedBox(
                width: 330,
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    elevation: 5,
                    color: lightGray,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const TextWidget(text: "How was your experience with Sovongdy?"),
                              Container(
                                height: 25,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 15, bottom: 5),
                                color: none,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (BuildContext context, int index){
                                    return const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 15),
                                      child: IconWidget(icon: Icons.star, size: 24, color: black,),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 15),
                                child: const TextFieldWidget(
                                  height: 40,
                                  inputType: TextInputType.text,
                                  hintText: 'Write your comment',
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 15),
                              child: ButtonWidget(
                                onPressed: (){},
                                height: 30,
                                width: 250,
                                child: const TextWidget(text: "Submit", color: white, fontWeight: FontWeight.bold,),
                              ),
                            ),
                          ),
                        ],
                      )
                    )
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: _buildIconBackColor(30, red, Icons.close, 24),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconBackColor(double size, Color color, IconData icon, double sizeIcon){
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
          child: IconWidget(
            icon: icon,
            color: white,
            size: sizeIcon,
          )
      ),
    );
  }
}
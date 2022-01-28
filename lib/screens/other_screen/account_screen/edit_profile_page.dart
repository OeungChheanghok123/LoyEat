import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back,
            color: black,
          ),
        ),
        title: const Text('Edit Profile',
          style: TextStyle(
            fontSize: 14,
            color: black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

import 'package:chat_app/const/constant.dart';
import 'package:flutter/material.dart';

class ButtonCust extends StatelessWidget {
  ButtonCust({super.key, required this.text, required this.ontap});
  String text;
  Function() ontap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shadowColor: kcolor,
          elevation: 10,
          minimumSize: Size(double.infinity, 40),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white),
      onPressed: ontap,
      child: Text(text),
    );
  }
}

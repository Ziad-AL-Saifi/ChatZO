import 'package:chat_app/const/constant.dart';
import 'package:flutter/material.dart';

class TextFieldCust extends StatelessWidget {
  TextFieldCust(
      {super.key,
      required this.hinttext,
      this.obscure = false,
      this.onTap,
      required this.iconCust});
  String? hinttext;
  bool obscure = false;
  IconData? iconCust;
  Function(String value)? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      onChanged: onTap,
      obscureText: obscure,
      decoration: InputDecoration(
          border: UnderlineInputBorder(borderSide: BorderSide(color: kcolor)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kcolor)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kcolor)),
          hintText: hinttext,
          suffixIcon: Icon(
            size: 18,
            iconCust,
            color: kcolor,
          )),
    );
  }
}

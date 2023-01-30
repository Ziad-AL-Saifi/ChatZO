import 'package:chat_app/model/massege_model.dart';
import 'package:flutter/material.dart';

class MassgeFome extends StatelessWidget {
  MassgeFome({
    Key? key,
    required this.massege,
  }) : super(key: key);
  MassegModel? massege;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 252, 244, 220),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            child: Padding(
              padding: EdgeInsets.all(35),
              child: Text(
                massege!.massege,
                style: TextStyle(fontSize: 16),
              ),
            )),
      ),
    );
  }
}

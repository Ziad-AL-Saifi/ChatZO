import 'package:chat_app/model/massege_model.dart';
import 'package:flutter/material.dart';

class MyMasseges extends StatelessWidget {
  MyMasseges({
    Key? key,
    required this.massege,
  }) : super(key: key);
  MassegModel? massege;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.amber[200],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(35),
              child: Text(
                massege!.massege,
                style: TextStyle(fontSize: 16),
              ),
            )),
      ),
    );
  }
}

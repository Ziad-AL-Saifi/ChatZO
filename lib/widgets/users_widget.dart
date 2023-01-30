import 'package:chat_app/const/constant.dart';
import 'package:chat_app/model/get_users.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  Users({super.key, required this.getUsers});

  GetUsersModel getUsers;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ChatPage.id, arguments: getUsers.email);
      },
      child: Card(
        child: Container(
          width: 10,
          height: 80,
          decoration: BoxDecoration(color: Colors.white),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(179, 160, 140, 140),
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(child: Text('image')),
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  getUsers.username,
                  style: TextStyle(fontSize: 20),
                )
              ]),
        ),
      ),
    );
  }
}

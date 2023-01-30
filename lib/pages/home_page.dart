import 'package:chat_app/const/constant.dart';
import 'package:chat_app/model/get_users.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/widgets/users_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  static String id = 'homePage';
  List<dynamic>? data = [];
  Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();
  GetUsersModel? getUsersGO;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: users,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        List<GetUsersModel> listUsers = [];
        if (snapshot.hasData) {
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            listUsers.add(GetUsersModel.getUsers(snapshot.data!.docs[i]));
          }
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: kcolor,
            title: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(child: Text('image')),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'Ziad Mohammad',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ],
            ),
            actions: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          LoginPage.id, (route) => false);
                    },
                    child: Text('Sign Out')),
              ))
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: listUsers.length,
                  padding: EdgeInsets.symmetric(vertical: 0),
                  itemBuilder: (context, index) {
                    if (listUsers[index].email == emailLogin) {
                      return Text('');
                    }
                    return Users(getUsers: listUsers[index]);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

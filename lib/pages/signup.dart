import 'package:chat_app/helper/snak_bar.dart';
import 'package:chat_app/pages/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../const/constant.dart';
import '../firebase/signup_firebase.dart';
import '../widgets/button_cust.dart';
import '../widgets/textfield.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final glopelkey = GlobalKey<FormState>();

  static String id = 'signup';
  String? email;
  String? password;
  String? username;
  String? phone;
  String? confarmPassword;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: kcolor,
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Sign Up ',
            style: TextStyle(color: Colors.black),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 50),
          child: Form(
            key: glopelkey,
            child: Container(
                child: Column(
              children: [
                TextFieldCust(
                  hinttext: 'Username',
                  iconCust: Icons.verified_user,
                  onTap: (value) {
                    username = value;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextFieldCust(
                  hinttext: 'Phone Number',
                  iconCust: Icons.phone,
                  onTap: (value) {
                    phone = value;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextFieldCust(
                  hinttext: 'Email',
                  iconCust: Icons.email,
                  onTap: (value) => email = value,
                ),
                SizedBox(
                  height: 30,
                ),
                TextFieldCust(
                    onTap: (value) {
                      password = value;
                    },
                    hinttext: 'Password',
                    obscure: true,
                    iconCust: Icons.password),
                SizedBox(
                  height: 30,
                ),
                TextFieldCust(
                  hinttext: 'Confarm Password',
                  iconCust: Icons.password,
                  obscure: true,
                  onTap: (value) => confarmPassword = value,
                ),
                SizedBox(
                  height: 30,
                ),
                ButtonCust(
                    text: 'Register',
                    ontap: () async {
                      if (password != confarmPassword) {
                        showSnack(
                            context, 'Please check your correct password');
                      } else {
                        if (glopelkey.currentState!.validate()) {
                          users.add({
                            'email': email,
                            'password': password,
                            'full_name': username, // John Doe
                            'phone': phone, // Stokes and Sons
                            // 42
                          });
                          await FirebaseRejastration(
                              context, email!, password!);
                        }
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(r"Do you have account ? "),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Login', style: TextStyle(color: kcolor)))
                  ],
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}

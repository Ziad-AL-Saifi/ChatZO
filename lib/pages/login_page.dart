import 'package:chat_app/const/constant.dart';
import 'package:chat_app/helper/snak_bar.dart';
import 'package:chat_app/pages/signup.dart';
import 'package:chat_app/widgets/button_cust.dart';
import 'package:chat_app/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

String? emailLogin;
String? password;

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final glopelkey = GlobalKey<FormState>();

  static String id = 'loginPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          actions: [
            Center(
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          SignUpPage.id, ((route) => true));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text('Sign up', style: TextStyle(color: kcolor)),
                    ))),
          ],
          title: Text(
            'Login',
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
                  hinttext: 'Email',
                  iconCust: Icons.email,
                  onTap: (value) => emailLogin = value,
                ),
                SizedBox(
                  height: 30,
                ),
                TextFieldCust(
                    hinttext: 'Password',
                    obscure: true,
                    onTap: (value) => password = value,
                    iconCust: Icons.password),
                SizedBox(
                  height: 30,
                ),
                ButtonCust(
                    text: 'Login',
                    ontap: () async {
                      try {
                        if (glopelkey.currentState!.validate()) {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: emailLogin!,
                            password: password!,
                          );
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              HomePage.id, (route) => false);
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnack(context,
                              'return Users(getUsers: listUsers[index])');
                        } else if (e.code == 'wrong-password') {
                          showSnack(
                              context, 'Wrong password provided for that user');
                        }
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(r"Don't have account ? "),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              SignUpPage.id, ((route) => true));
                        },
                        child: Text('Sign Up', style: TextStyle(color: kcolor)))
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

import 'package:chat_app/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../helper/snak_bar.dart';
import '../pages/home_page.dart';

Future<void> FirebaseRejastration(
    BuildContext context, String email, String password) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    Navigator.of(context).pushNamedAndRemoveUntil(
        LoginPage.id, (route) => false,
        arguments: email);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      showSnack(context, 'The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      showSnack(context, 'The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

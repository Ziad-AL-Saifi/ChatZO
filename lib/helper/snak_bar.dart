import 'package:flutter/material.dart';

void showSnack(BuildContext context, String mess) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mess)));
}

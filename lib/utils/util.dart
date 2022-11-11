import 'package:flutter/material.dart';

class Utils {

   final messengerkey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String? text) {
    
  if (text == null) return;

   final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,);
      messengerkey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

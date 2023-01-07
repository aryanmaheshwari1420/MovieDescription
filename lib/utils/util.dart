import 'package:flutter/material.dart';

class Utils {

  static final messengerkey = GlobalKey<ScaffoldMessengerState>();
  static void showSnackBar(String? text) {    
  if (text == null) return;
   final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.green);
      messengerkey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

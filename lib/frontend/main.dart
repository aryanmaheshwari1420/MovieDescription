// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviedescription/frontend/Home.dart';
import 'package:moviedescription/frontend/Login.dart';
import 'package:moviedescription/frontend/SignUp.dart';
import 'package:moviedescription/frontend/WelcomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(brightness: Brightness.light, primaryColor: Colors.green),
    home: WelcomeScreen(),
    routes: {
      'S1': (context) => WelcomeScreen(),
      'S2': (context) => Login(),
      'S3': (context) => SignUp(),
      'S4': (context) => Home()
    },
  ));
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:moviedescription/authentication/HomePage.dart';
import 'package:moviedescription/authentication/auth_page.dart';
import 'package:moviedescription/authentication/login.dart';
import 'package:moviedescription/frontend/Home.dart';
import 'package:moviedescription/frontend/WelcomeScreen.dart';
import 'package:moviedescription/utils/util.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // var title;
  runApp(MaterialApp(
      scaffoldMessengerKey: Utils.messengerkey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      // title: title,
      home: Mainpage()));
}

final navigatorKey = GlobalKey<NavigatorState>();

class Mainpage extends StatelessWidget {
  static final String title = 'Firebase Auth';
  const Mainpage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            else if (snapshot.hasError)
              return Center(child: Text("Something went wrong!"));
            else if (snapshot.hasData) {
              return Home();
            } else {
              return AuthPage();
            }
          }),
    );
  }
}

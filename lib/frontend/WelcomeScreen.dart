// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:moviedescription/authentication/login.dart';
import 'package:moviedescription/authentication/sign_up.dart';
import 'package:moviedescription/frontend/Login.dart';
import 'package:moviedescription/frontend/SignUp.dart';


class WelcomeScreen extends StatelessWidget {
  // String title = '';
  WelcomeScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: new AssetImage("images/J59.gif"),
                    // image: NetworkImage(
                    //     "https://images.unsplash.com/photo-1557683316-973673baf926?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE4fHx8ZW58MHx8fHw%3D&w=1000&q=80"),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // color: Colors.red,

              height: 800,
              width: 450,
              child: Padding(
                padding: const EdgeInsets.only(top: 95, left: 15),
                child: Text(
                  "Welcome to     \n     MeetMe app",
                  style: TextStyle(
                      fontSize: 35, color: Color.fromARGB(255, 193, 213, 214)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 370, left: 15),
            child: Container(
              height: 400,
              width: 370,
              // color: Colors.green,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 50),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 27, 88, 125),
                          shadowColor: Colors.grey,
                          padding: EdgeInsets.symmetric(
                              horizontal: 100.0, vertical: 8.0),
                          shape: StadiumBorder(),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginWidget(onClickedSignUp: () { },);
                          }));
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 27, 88, 125),
                          shadowColor: Colors.lightBlueAccent,
                          padding: EdgeInsets.symmetric(
                              horizontal: 100.0, vertical: 8.0),
                          shape: StadiumBorder(),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignUpWidget(onClickedSignIn: () { },);
                          }));
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

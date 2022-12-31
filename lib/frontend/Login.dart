// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, void_checks

// import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'SignUp.dart';

class Login extends StatefulWidget {
  Login({Key? key,}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _passcontroller = TextEditingController();
  final _emailcontroller = TextEditingController();

  var _securetext = true;
  var _erroremail = null;
  var _errorpass = null;

  //creating an instance of firebase

  final firebase = FirebaseFirestore.instance;

  void printData() async {
    try {
      print(
          "email:${_emailcontroller.text} \n password : ${_passcontroller.text}");
      await firebase.collection("User Login").doc(_emailcontroller.text).set({
        "email": _emailcontroller.text,
        "password": _passcontroller.text,
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void clearText() {
    _emailcontroller.clear();
    _passcontroller.clear();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text(
            "Sign in",
            style: TextStyle(
              color: Color.fromARGB(255, 238, 243, 244),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 179, 160, 120),
      ),
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1508615039623-a25605d2b022?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8bG9naW58ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
                    fit: BoxFit.cover))),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            // color: Colors.red,
            height: 800,
            width: 450,
            child: Padding(
              padding: const EdgeInsets.only(top: 55, left: 18),
              child: Text("Login",
                  style: TextStyle(fontSize: 50, color: Colors.white)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80, left: 12),
          child: Container(
            // color: Colors.green,
            height: 570,
            width: 370,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 10, right: 10),
                  child: TextField(
                    controller: _emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: _emailcontroller.clear,
                          icon: Icon(Icons.clear)),
                      errorText: _erroremail,
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      hintText: 'Email',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: TextField(
                    controller: _passcontroller,
                    obscureText: _securetext,
                    decoration: InputDecoration(
                        errorText: _errorpass,
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        hintText: 'password',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _securetext = !_securetext;
                              });
                            },
                            icon: Icon(_securetext
                                ? Icons.remove_red_eye_sharp
                                : Icons.remove_red_eye_outlined))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignUp();
                          }));
                        },
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        )),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 89, 96, 96),
                        shadowColor: Color.fromARGB(255, 187, 186, 179),
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 8.0),
                        shape: StadiumBorder(),
                      ),
                      onPressed: () {
                        setState(() {
                          if (_emailcontroller.text.length <= 5) {
                            if (_passcontroller.text.length <= 5) {
                              _errorpass = "Enter a valid pass";
                            }
                            _erroremail = "Enter a valid email";
                          }  else {
                            printData();
                        Navigator.popAndPushNamed(context, "S4");
                          }
                        });
                        _emailcontroller.clear();
                        _passcontroller.clear();
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 24,
                            fontWeight: FontWeight.w800),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Expanded(
                      child: Divider(
                        indent: 20.0,
                        endIndent: 10.0,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      "OR",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    Expanded(
                      child: Divider(
                        indent: 10.0,
                        endIndent: 20.0,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not registered yet?",
                      style: TextStyle(
                          fontSize: 15, color: Color.fromARGB(255, 54, 60, 61)),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignUp();
                          }));
                        },
                        child: Text(
                          "Create an account",
                          style: TextStyle(fontSize: 20),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Expanded(
                      child: Divider(
                        indent: 20.0,
                        endIndent: 10.0,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      "OR",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    Expanded(
                      child: Divider(
                        indent: 10.0,
                        endIndent: 20.0,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 73, top: 20),
                      child: Image(
                        image: AssetImage("images/google.png"),
                        height: 60,
                        width: 45,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, top: 20),
                      child: Image(
                        image: AssetImage("images/insta.png"),
                        height: 60,
                        width: 55,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, top: 20),
                      child: Image(
                        image: AssetImage("images/twitter.png"),
                        height: 60,
                        width: 45,
                      ),
                    ),
                    // Image(image: AssetImage("images/insta.png"), height: 10,width: 10,),
                    // Image(image: AssetImage("images/twitter.png"), height: 10,width: 10,),
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}

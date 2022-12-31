// ignore_for_file: prefer_const_constructors, avoid_returning_null_for_void

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key,}) : super(key: key);

  @override
  State<SignUp> createState() => _screen_3State();
}

class _screen_3State extends State<SignUp> {
  var _secureText = true;
  var _secureText_2 = true;
  var msgController = TextEditingController();
  String? _emailError = null;
  var _passError = null;
  var _repasserror = null;
  TextEditingController _passcontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _re_passcontroller = TextEditingController();

  final firebase = FirebaseFirestore.instance;

  void printData() async {
    try {
      print(
          "email:${_emailcontroller.text} \n password : ${_passcontroller.text} \n re-pass : ${_re_passcontroller.text}");
      await firebase.collection("User Sign up").doc(_emailcontroller.text).set({
        "email": _emailcontroller.text,
        "password": _passcontroller.text,
        "re-password": _re_passcontroller.text,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
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
              padding: const EdgeInsets.only(top: 30, left: 23),
              child: Text("Sign up",
                  style: TextStyle(fontSize: 50, color: Colors.white)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 122, left: 25, right: 25),
          child: Container(
            //  color: Colors.green,
            height: 530,
            width: 370,
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: _emailcontroller.clear,
                        icon: Icon(Icons.clear)),
                    errorText: _emailError,
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    hintText: 'Email',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _passcontroller,
                  decoration: InputDecoration(
                      errorText: _passError,
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
                              _secureText = !_secureText;
                            });
                          },
                          icon: Icon(_secureText
                              ? Icons.remove_red_eye_sharp
                              : Icons.remove_red_eye_outlined))),
                  obscureText: _secureText,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  obscureText: _secureText_2,
                  controller: _re_passcontroller,
                  decoration: InputDecoration(
                      errorText: _repasserror,
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      hintText: 'Re-enter your password',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _secureText_2 = !_secureText_2;
                            });
                          },
                          icon: Icon(_secureText_2
                              ? Icons.remove_red_eye_sharp
                              : Icons.remove_red_eye_outlined))),
                ),
                SizedBox(
                  height: 40,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                           primary: Color.fromARGB(255, 89, 96, 96),
                          shadowColor: Color.fromARGB(255, 187, 186, 179),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 8.0),
                          shape: StadiumBorder(),
                        ),
                        onPressed: () {
                          setState(() {
                            if (_emailcontroller.text.length <= 5 ||
                                _emailcontroller.text.isEmpty) {
                              if (_passcontroller.text.length <= 5 ||
                                  _passcontroller.text.isEmpty) {
                                if (_re_passcontroller.text.length <= 5 ||
                                    _re_passcontroller.text.isEmpty) {
                                  _repasserror = "Enter the same pass";
                                }
                                _passError = "Enter a valid pass";
                              }
                              _emailError = "Enter a valid email";
                            } else {
                              printData();
                          Navigator.pushNamed(context, "S2");

                            }
                          });
                          _emailcontroller.clear();
                          _passcontroller.clear();
                          _re_passcontroller.clear();
                        },
                        child: Center(
                          child: Text(
                            "Create an account",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 24,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   width: 90,
                    // ),
                    // CircleAvatar(
                    //     radius: 30,
                    //     backgroundColor: Colors.blueAccent,
                    //     child: IconButton(
                    //         color: Colors.white,
                    //         onPressed: () {},
                    //         icon: Icon(Icons.arrow_forward))),
                  ],
                ),

                SizedBox(
                  height:30,
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
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already registered?",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 54, 60, 61))),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'S2');
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyle(fontSize: 20),
                        )
                      ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                
                // Container(
                //   child: ElevatedButton(
                //     child: Text("go to screen 4"),
                //     onPressed: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) {
                //         return Screen4(
                //           title: 'pizza screen',
                //         );
                //       }));
                //     },
                //   ),
                // )
              ],
            ),
          ),
        )
      ]),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:moviedescription/authentication/forgot_password.dart';
import 'package:moviedescription/frontend/SignUp.dart';
import 'package:moviedescription/main.dart';
import 'package:moviedescription/utils/util.dart';
import 'auth_page.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginWidget({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);
  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  var _securetext = true;
  var _erroremail = null;
  var _errorpass = null;

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
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
        backgroundColor: Color.fromARGB(255, 179, 160, 122),
      ),
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1508615039623-a25605d2b022?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8bG9naW58ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
                    fit: BoxFit.fitHeight))),
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 80, left: 10, right: 10),
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: emailController.clear,
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
                    padding:
                        const EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: TextField(
                      controller: passController,
                      // obscureText: _securetext,
                      decoration: InputDecoration(
                          // errorText: _errorpass,
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
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                // decoration: TextDecoration.underline,
                                color: Colors.black54,
                                fontSize: 15,
                              ),
                            ),
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: ((context) => ForgotPassword())))),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 89, 96, 96),
                          shadowColor: Color.fromARGB(255, 187, 186, 179),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 8.0),
                          shape: StadiumBorder(),
                        ),
                        onPressed: signIn,
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
                          indent: 12.0,
                          endIndent: 20.0,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "Not registered yet?  ",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 54, 60, 61)),
                              children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = widget.onClickedSignUp,
                                text: 'Create an account',
                                style: TextStyle(fontSize: 16,decoration: TextDecoration.underline),

                                ),
                                
                          ]))
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
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );

  }

  Future signIn() async {
    showDialog(
        barrierDismissible: false,
        builder: ((context) =>
            const Center(child: CircularProgressIndicator())),
        context: context);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }
    // Navigator.of(context) not working!
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

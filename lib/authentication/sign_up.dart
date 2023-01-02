import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:moviedescription/authentication/login.dart';
import 'package:moviedescription/frontend/Login.dart';
import 'package:moviedescription/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:moviedescription/utils/util.dart';

class SignUpWidget extends StatefulWidget {
  final Function() onClickedSignIn;

  const SignUpWidget({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final _re_passcontroller = TextEditingController();

  var _secureText = true;
  var _secureText_2 = true;
  var msgController = TextEditingController();
  String? _emailError = null;
  var _passError = null;
  var _repasserror = null;

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  void clearText() {
    emailController.clear();
    passController.clear();
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
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  // TextField(
                  //   keyboardType: TextInputType.emailAddress,
                  //   controller: emailController,
                  //   decoration: InputDecoration(
                  //     suffixIcon: IconButton(
                  //         onPressed: emailController.clear,
                  //         icon: Icon(Icons.clear)),
                  //     errorText: _emailError,
                  //     fillColor: Colors.grey.shade300,
                  //     filled: true,
                  //     hintText: 'Email',
                  //     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(25),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 30,
                  // ),
                  // TextField(
                  //   controller: passController,
                  //   decoration: InputDecoration(
                  //       errorText: _passError,
                  //       fillColor: Colors.grey.shade300,
                  //       filled: true,
                  //       hintText: 'password',
                  //       contentPadding:
                  //           EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(25),
                  //       ),
                  //       suffixIcon: IconButton(
                  //           onPressed: () {
                  //             setState(() {
                  //               _secureText = !_secureText;
                  //             });
                  //           },
                  //           icon: Icon(_secureText
                  //               ? Icons.remove_red_eye_sharp
                  //               : Icons.remove_red_eye_outlined))),
                  //   obscureText: _secureText,
                  // ),
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,

                      // cursorColor: Colors.white,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        // errorText: _emailError,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border:
                            OutlineInputBorder(borderRadius: BorderRadius.zero),
                        filled: true,
                        fillColor: Color.fromARGB(255, 220, 214, 214),
                        hintText: 'Email',
                        // suffixIcon: IconButton(onPressed:emailController.clear(), icon: Icon(Icons.clear))
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Enter a valid Email'
                              : null),
                  const SizedBox(height: 30),
                  TextFormField(
                      controller: passController,
                      cursorColor: Colors.white,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          // border: BorderRadius.circular(10),
                          // suffixIcon: IconButton(
                          //           onPressed: () {
                          //             setState(() {
                          //               _secureText = !_secureText;
                          //             });
                          //           },
                          //           icon: Icon(_secureText
                          //               ? Icons.remove_red_eye_sharp
                          //               : Icons.remove_red_eye_outlined)),
                          fillColor: Color.fromARGB(255, 220, 214, 214),
                          labelText: "Password"),
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 6
                          ? 'Enter min 6 characters'
                          : null),
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
                          onPressed: (() {
                            signUp();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginWidget(onClickedSignUp: () {  },)),
                            );
                          }),
                          // onPressed: () {
                          //   setState(() {
                          //     if (_emailcontroller.text.length <= 5 ||
                          //         _emailcontroller.text.isEmpty) {
                          //       if (_passcontroller.text.length <= 5 ||
                          //           _passcontroller.text.isEmpty) {
                          //         if (_re_passcontroller.text.length <= 5 ||
                          //             _re_passcontroller.text.isEmpty) {
                          //           _repasserror = "Enter the same pass";
                          //         }
                          //         _passError = "Enter a valid pass";
                          //       }
                          //       _emailError = "Enter a valid email";
                          //     } else {
                          //       printData();
                          //   Navigator.pushNamed(context, "S2");
                          //     }
                          //   });
                          //   _emailcontroller.clear();
                          //   _passcontroller.clear();
                          //   _re_passcontroller.clear();
                          // },
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
                    height: 30,
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text("Already registered?",
                      //     style: TextStyle(
                      //         fontSize: 15,
                      //         color: Color.fromARGB(255, 54, 60, 61))),
                      // TextButton(
                      //     onPressed: () {
                      //       Navigator.pushNamed(context, 'S2');
                      //     },
                      //     child: Text(
                      //       "Sign in",
                      //       style: TextStyle(fontSize: 20),
                      //     )
                      //   ),
                      RichText(
                          text: TextSpan(
                              text: 'Already registered?  ',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 54, 60, 61),
                                fontSize: 15,
                              ),
                              children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = widget.onClickedSignIn,
                              text: 'Sign Up',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            )
                          ]))
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
          ),
        )
      ]),
    );

//  ----------------------------------------------------------------------------------

    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            TextFormField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: "Email"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Enter a valid Email'
                        : null),
            const SizedBox(height: 4),
            TextFormField(
                controller: passController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value != null && value.length < 6
                    ? 'Enter min 6 characters'
                    : null),
            const SizedBox(height: 20),
            ElevatedButton.icon(
                onPressed: signUp,
                icon: const Icon(
                  Icons.lock_open,
                  size: 32,
                ),
                label: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                )),
            const SizedBox(
              height: 24,
            ),
            RichText(
                text: TextSpan(
                    text: 'Already have an account? ',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                    children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignIn,
                    text: 'Sign Up',
                    style: const TextStyle(
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                    ),
                  )
                ]))
          ],
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        barrierDismissible: false,
        builder: ((context) =>
            const Center(child: CircularProgressIndicator())),
        context: context);
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }
    // Navigator.of(context) not working!
    // navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

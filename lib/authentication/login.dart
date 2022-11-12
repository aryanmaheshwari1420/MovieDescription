

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:moviedescription/main.dart';

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

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          TextField(
            controller: emailController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: "Email"),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: passController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
              onPressed: signIn,
              icon: const Icon(
                Icons.lock_open,
                size: 32,
              ),
              label: const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 24,
                ),
              )),
          const SizedBox(
            height: 24,
          ),
          GestureDetector(
            child: const Text('Forgot Password?',
            style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.amber,
                  fontSize: 20,
            ),
            ),
          ),
          RichText(
              text:  TextSpan(
                  text: 'No account ?',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                  children: [
                TextSpan(
                  recognizer: TapGestureRecognizer() 
                  ..onTap = widget.onClickedSignUp,
                  text: 'Sign Up',
                  style: const TextStyle(
                    fontSize: 24,
                    decoration: TextDecoration.underline,
                  ),
                )
              ]))
        ],
      ),
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
    }
    // Navigator.of(context) not working!
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

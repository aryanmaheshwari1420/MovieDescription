// import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:moviedescription/authentication/HomePage.dart';
// import 'package:moviedescription/utils/util.dart';

// class VerifyEmailpage extends StatefulWidget {
//   const VerifyEmailpage({super.key});

//   @override
//   State<VerifyEmailpage> createState() => _VerifyEmailpageState();
// }

// class _VerifyEmailpageState extends State<VerifyEmailpage> {
//   bool isEmailVerified = false;
//   Timer? timer;
//   bool canResendEmail = false;

//   @override
//   void initState() {
//     super.initState();

//     // user needs to be created before
//     isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

//     if (!isEmailVerified) {
//       sendVerificationEmail();

//       timer = Timer.periodic(
//         Duration(seconds: 3),
//         (_) => checkEmailVerified(),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     timer?.cancel();

//     super.dispose();
//   }

//   Future sendVerificationEmail() async {
//     try {
//       final user = FirebaseAuth.instance.currentUser!;
//       await user.sendEmailVerification();

//       setState(() => canResendEmail = false);
//       await Future.delayed(Duration(seconds: 5));
//       setState(() => canResendEmail = true);
//     } catch (e) {
//       Utils.showSnackBar(e.toString());
//     }
//   }

//   Future checkEmailVerified() async {
//     // call after email verification!
//     await FirebaseAuth.instance.currentUser!.reload();
//     setState(() {
//       isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
//     });

//     if (isEmailVerified) timer?.cancel();
//   }

//   @override
//   Widget build(BuildContext context) => isEmailVerified
//       ? const HomePage()
//       : Scaffold(
//           appBar: AppBar(
//             title: Text('Verify Email'),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'A verification email has been sent to u',
//                   style: TextStyle(fontSize: 20),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(
//                   height: 24,
//                 ),
//                 ElevatedButton.icon(
//                   onPressed: canResendEmail ? sendVerificationEmail : null,
//                   icon: Icon(Icons.email, size: 32),
//                   label: Text(
//                     'Reset Email',
//                     style: TextStyle(),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                       minimumSize: Size.fromHeight(50)),
//                 ),
//                 SizedBox(height: 8,),
//                 TextButton(
//                 onPressed: ()=>FirebaseAuth.instance.signOut(), 
//                 child: Text('Cancel',style: TextStyle(fontSize: 24),))
//               ],
//             ),
//           ),
//         );
// }

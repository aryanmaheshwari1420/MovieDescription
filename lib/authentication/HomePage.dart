import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(title: const Text("logout Page"),),
      body:  Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Signed In as',style: TextStyle(fontSize: 16),),
            const SizedBox(height: 8,),
            Text(user.email!,
            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40,),
            ElevatedButton.icon(onPressed: ()=>FirebaseAuth.instance.signOut(), icon: const Icon(Icons.arrow_back), label: const Text("sign out",style: TextStyle(fontSize: 24),))
          
        ],),
      )
    );
  }
}

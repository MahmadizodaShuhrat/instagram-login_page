import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram2/auth/auth_sreen.dart';
import 'package:instagram2/widgets/navigation.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,snapshot){
        if (snapshot.hasData) {
          return  Navigation_sceen();
        }else{
          return const Authscreen();
        }
      },
      ),
    );
  }
}

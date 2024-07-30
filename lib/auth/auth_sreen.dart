import 'package:flutter/material.dart';
import 'package:instagram2/screen/login_page.dart';
import 'package:instagram2/screen/sign_up.dart';

class Authscreen extends StatefulWidget {
  const Authscreen({super.key});

  @override
  State<Authscreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Authscreen> {
bool a =true;
void go(){
  setState(() {
    a=!a;
  });
}

  @override
  Widget build(BuildContext context) {
    if (a) {
      return LoginPage(go);
    }else{
      return SignupScrin(go);
    }
  }
}
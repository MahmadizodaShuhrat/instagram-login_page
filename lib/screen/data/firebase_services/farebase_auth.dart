import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram2/screen/data/firebase_services/firestore.dart';
import 'package:instagram2/screen/data/firebase_services/storage.dart';
import 'package:instagram2/unti/exeption.dart';

class Authetication {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void>Login({
    required String email,
    required String password,
  }) async{
    try{
await _auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
    } on FirebaseException catch(e){
      throw exeption(e.message.toString());
    }
  }
  Future<void> Signup({
    required String email,
    required String password,
    required String passwordConfirme,
    required String username,
    required String bio,
    required File profile,
  }) async {
    String URL;
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          bio.isNotEmpty) {
        if (password == passwordConfirme) {
          await _auth.createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());
          if (profile != File('')) {
            URL =
                await StorageMethod().uploadImageToStorage('Profile', profile);
          } else {
            URL = '';
          }
          await Firebase_firestore().CreatUser(
              email: email,
              username: username,
              bio: bio,
              profile: URL == ''
                  ? 'https://firebasestorage.googleapis.com/v0/b/instagram-8a227.appspot.com/o/person.png?alt=media&token=c6fcbe9d-f502-4aa1-8b4b-ec37339e78ab'
                  : URL);
        } else {
          throw exeption('password and confirm password should be same');
        }
      } else {
        throw exeption('password all the fields');
      }
    }  on FirebaseException catch(e){
      throw exeption(e.message.toString());
    }
  }
}

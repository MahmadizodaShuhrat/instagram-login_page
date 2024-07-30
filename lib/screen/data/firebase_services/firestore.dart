import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram2/screen/usermodel.dart';
import 'package:instagram2/unti/exeption.dart';
import 'package:uuid/uuid.dart';
class Firebase_firestore{
  final FirebaseFirestore _firebasefirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
 
 Future<bool> CreatUser({
required String email,
required String username,
required String bio,
required String profile,


 })async{
  await _firebasefirestore
  .collection('Users')
  .doc(_auth.currentUser!.uid)
  .set({
'email':email,
'username':username,
'bio':bio,
'profile':profile,
'followers':[],
'following':[],
  });
  return true;
 }

Future<Usermodel> getUser()async{
  try{
    final user = await _firebasefirestore.collection('user').doc(_auth.currentUser!.uid).get();
    final snapuser = user.data!();
    return Usermodel(snapuser!['bio'],snapuser['email'], snapuser['profile'], snapuser['username'], snapuser['followers'], snapuser['following']);
  } on FirebaseException catch(e){
    throw exeption(e.message.toString());
  }

}

Future<bool>CreatePost({
  required String postImage,
  required String caption,
  required String location,
}) async{
  var uid = Uuid().v4();
  DateTime data = new DateTime.now();
  Usermodel user = await getUser();
  await _firebasefirestore.collection('posts').doc(uid).set({
    'postImage':postImage,
    'Username':user.username,
    'profileImage':user.profile,
  });
  return true; 
}
}
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram2/screen/data/firebase_services/farebase_auth.dart';
import 'package:instagram2/unti/dialog.dart';
import 'package:instagram2/unti/exeption.dart';

class SignupScrin extends StatefulWidget {
  final VoidCallback show;
  const SignupScrin(this.show, {super.key});

  @override
  State<SignupScrin> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignupScrin> {
  final email = TextEditingController();
  FocusNode email_F = FocusNode();
  final password = TextEditingController();
  FocusNode password_F = FocusNode();
  final bio = TextEditingController();
  FocusNode bio_F = FocusNode();
  final username = TextEditingController();
  FocusNode username_F = FocusNode();
  final passwordConfirme = TextEditingController();
  FocusNode passwordConfirme_F = FocusNode();
  
  File? _imagefilee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: 96.w,
              height: 30.h,
            ),
            SizedBox(height: 20.h),
            Center(
                child: InkWell(
                  onTap: () async {
                    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      setState(() {
                        _imagefilee = File(pickedFile.path);
                      });
                    }
                  },
                  child: CircleAvatar(
                    radius: 64.r,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: _imagefilee != null ? FileImage(_imagefilee!) : AssetImage("images/iconperson.png") as ImageProvider,
                    child: _imagefilee == null ? Icon(Icons.add_a_photo, size: 32.r, color: Colors.grey) : null,
                  ),
                )),
            SizedBox(height: 60.h),
            Textfield(email, Icons.email, 'Email', email_F),
            SizedBox(
              height: 15.h,
            ),
            Textfield(username, Icons.person, 'Username', username_F),
            SizedBox(
              height: 10.h,
            ),
            Textfield(bio, Icons.abc, 'Bio', bio_F),
            SizedBox(
              height: 10.h,
            ),
            Textfield(password, Icons.lock, 'Password', password_F),
            SizedBox(
              height: 10.h,
            ),
            Textfield(passwordConfirme, Icons.lock, 'PasswordConfirme', passwordConfirme_F),
            SizedBox(
              height: 20.h,
            ),
            Signup(),
            SizedBox(
              height: 10.h,
            ),
            Have()
          ],
        )),
      ),
    );
  }

  Widget Have() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Don't have account? ",
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          GestureDetector(
            onTap: widget.show,
            child: Text(
              "Signup ",
              style: TextStyle(fontSize: 15, color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }

  Widget Signup() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: InkWell(
        onTap: () async {
          try {
            await Authetication().Signup(
                email: email.text,
                password: password.text,
                passwordConfirme: passwordConfirme.text,
                username: username.text,
                bio: bio.text,
                profile: _imagefilee ?? File('')); // Ислоҳот дар ин ҷо
          } on exeption catch (e) {
            dialogBuilder(context, e.massage);
          }
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 44.h,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10.r)),
          child: Text(
            'Sign up',
            style: TextStyle(
                fontSize: 23.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget Forgot() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Text(
        "Forget your password",
        style: TextStyle(
            fontSize: 13.sp, color: Colors.blue, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget Textfield(TextEditingController controller, IconData icon, String type,
      FocusNode focusNode) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        height: 44.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: TextField(
          style: TextStyle(fontSize: 18.sp, color: Colors.black),
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: type,
            prefixIcon: Icon(icon,
                color: focusNode.hasFocus ? Colors.black : Colors.grey),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide(color: Colors.grey, width: 2.w)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide(color: Colors.grey, width: 2.w)),
          ),
        ),
      ),
    );
  }
}

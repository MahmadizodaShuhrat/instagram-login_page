import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram2/screen/data/firebase_services/farebase_auth.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback show;
  const LoginPage(this.show, {super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  FocusNode email_F = FocusNode();
  final password = TextEditingController();
  FocusNode password_F = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 96.w,
            height: 100.h,
          ),
          Center(
            child: Image.asset("images/logotip.png"),
          ),
          SizedBox(height: 120.h),
          Textfield(email, Icons.email, 'Email', email_F),
          SizedBox(
            height: 15.h,
          ),
          Textfield(password, Icons.lock, 'Password', password_F),
          SizedBox(
            height: 10.h,
          ),
          Forgot(),
          SizedBox(
            height: 10.h,
          ),
          Login(),
          SizedBox(
            height: 10.h,
          ),
          Have()
        ],
      )),
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

  Widget Login() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: InkWell(
        onTap: () async {
          await Authetication()
              .Login(email: email.text, password: password.text);
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 44.h,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10.r)),
          child: Text(
            'Login',
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

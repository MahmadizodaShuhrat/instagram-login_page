import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram2/widgets/post_widgets.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: SizedBox(
            width: 105.w,
            height: 28.h,
            child: Image.asset("images/logotip.png")),
        leading: Image.asset("images/camera.png"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.favorite_border_outlined,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset("images/massage.png"),
          ),
        ],
        backgroundColor: Color(0xffFAFAFA),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return PostWidgets();
            },
            childCount: 5,
          ))
        ],
      ),
    );
  }
}

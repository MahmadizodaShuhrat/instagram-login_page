import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram2/screen/add_post_screen.dart';
import 'package:instagram2/screen/add_rells_scren.dart';

class Addscreen extends StatefulWidget {
  const Addscreen({super.key});

  @override
  State<Addscreen> createState() => _AddscreenState();
}

int _currentindex = 0;

class _AddscreenState extends State<Addscreen> {
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  onPageChanged(int page) {
    setState(() {
      _currentindex = page;
    });
  }

  navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: pageController,
            onPageChanged: onPageChanged,
            children: const [
              AddPostScreen(),
              AddRellsScren(),
            ],
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            bottom: 10.h,
            right: _currentindex == 0 ? 100.w : 150.w,
            child: Container(
              width: 120.w,
              height: 30.h,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      navigationTapped(0);
                    },
                    child: Text(
                      'Post',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: _currentindex == 0 ? Colors.white : Colors.grey),
                    ),
                  ),
                  GestureDetector(
                     onTap: () {
                      navigationTapped(1);
                    },
                    child: Text(
                      'Reels',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: _currentindex == 1 ? Colors.white : Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

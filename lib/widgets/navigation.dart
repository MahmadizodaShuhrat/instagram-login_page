import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram2/screen/addscreen.dart';
import 'package:instagram2/screen/explor.dart';
import 'package:instagram2/screen/home.dart';
import 'package:instagram2/screen/profile_screen.dart';
import 'package:instagram2/screen/rels.dart';

class Navigation_sceen extends StatefulWidget {
  const Navigation_sceen({super.key});

  @override
  State<Navigation_sceen> createState() => _Navigation_sceenState();
}

int _currentindex = 0;

class _Navigation_sceenState extends State<Navigation_sceen> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            currentIndex: _currentindex,
            onTap: navigationTapped,
            items:  [
            const  BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            const  BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
            const  BottomNavigationBarItem(icon: Icon(Icons.camera), label: ''),
              BottomNavigationBarItem(icon: Image.asset('images/image.png',height: 28,), label: ''),
            const  BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
            ]),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
children: [
  Homescreen(),
  ExplorScreen(),
  Addscreen(),
  RelsScren(),
  ProfileScreen(),
],
      ),
    );
  }
}

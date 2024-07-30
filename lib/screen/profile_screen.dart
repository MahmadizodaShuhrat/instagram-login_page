// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram2/screen/usermodel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // backgroundColor: Colors.grey.shade100,
        // body: SafeArea(
        //   child: CustomScrollView(
        //     slivers: [
        //       SliverToBoxAdapter(
        //         child: FutureBuilder(
        //           future: Firebase.firestore().getUser(), // Adjust this method call according to your implementation
        //           builder: (context, AsyncSnapshot<Usermodel> snapshot) {
        //             if (!snapshot.hasData) {
        //               return Center(child: CircularProgressIndicator());
        //             }
        //             return Head(snapshot.data!);
        //           },
        //         ),
        //       ),
        //       StreamBuilder(
        //         stream: _firebaseFirestore
        //             .collection('Posts')
        //             .where('uid', isEqualTo: _auth.currentUser!.uid)
        //             .snapshots(),
        //         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //           if (!snapshot.hasData) {
        //             return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
        //           }
        //           var snapLength = snapshot.data!.docs.length; // Use ! to assert non-nullability
        //           return SliverGrid(
        //             delegate: SliverChildBuilderDelegate(
        //               (context, index) {
        //                 var snap = snapshot.data!.docs[index]; // Use ! to assert non-nullability
        //                 return Container(
        //                   child: CachedImage(snap['PostImage']),
        //                 );
        //               },
        //               childCount: snapLength,
        //             ),
        //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //               crossAxisCount: 4,
        //               crossAxisSpacing: 4,
        //               mainAxisSpacing: 4,
        //             ),
        //           );
        //         },
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }

  Widget Head(Usermodel user) {
    return Container(
      // color: Colors.white,
      // padding: EdgeInsets.only(bottom: 5.h),
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Row(
      //       children: [
      //         Padding(
      //           padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
      //           child: ClipOval(
      //             child: SizedBox(
      //               width: 80.w,
      //               height: 80.h,
      //               child: CachedImage(user.profile),
      //             ),
      //           ),
      //         ),
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Row(
      //               children: [
      //                 SizedBox(width: 35.w),
      //                 Text(
      //                   '0',
      //                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
      //                 ),
      //                 SizedBox(width: 53.w),
      //                 Text(
      //                   user.followers.length.toString(),
      //                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
      //                 ),
      //                 SizedBox(width: 53.w),
      //                 Text(
      //                   user.following.length.toString(),
      //                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
      //                 ),
      //               ],
      //             ),
      //             Row(
      //               children: [
      //                 SizedBox(width: 28.w),
      //                 Text(
      //                   'Posts',
      //                   style: TextStyle(fontSize: 13.sp),
      //                 ),
      //                 SizedBox(width: 23.w),
      //                 Text(
      //                   'Followers',
      //                   style: TextStyle(fontSize: 13.sp),
      //                 ),
      //                 SizedBox(width: 17.w),
      //                 Text(
      //                   'Following',
      //                   style: TextStyle(fontSize: 13.sp),
      //                 ),
      //               ],
      //             )
      //           ],
      //         )
      //       ],
      //     ),
      //     Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 20.w),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(
      //             user.username,
      //             style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
      //           ),
      //           SizedBox(height: 5.h),
      //           Text(
      //             user.bio,
      //             style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 15.w),
      //       child: Container(
      //         alignment: Alignment.center,
      //         height: 30.h,
      //         width: double.infinity,
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(5),
      //           border: Border.all(color: Colors.grey.shade400),
      //         ),
      //         child: Text('Edit your Profile'),
      //       ),
      //     ),
      //     SizedBox(height: 5.h),
      //     SizedBox(
      //       width: double.infinity,
      //       height: 30.h,
      //       child: const TabBar(
      //         unselectedLabelColor: Colors.grey,
      //         labelColor: Colors.black,
      //         indicatorColor: Colors.black,
      //         tabs: [
      //           Icon(Icons.grid_on),
      //           Icon(Icons.video_collection),
      //           Icon(Icons.person),
      //         ],
      //       ),
      //     ),
      //     SizedBox(height: 5.h)
      //   ],
      // ),
    );
  }
}

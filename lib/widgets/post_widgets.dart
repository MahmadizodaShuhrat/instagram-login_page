import 'package:flutter/material.dart';

class PostWidgets extends StatelessWidget {
  const PostWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
                children: [
                  Container(
                    width: 375,
                    height: 54,
                    color: Colors.white,
                    child: Center(
                      child: ListTile(
                        leading: ClipOval(
                          child: SizedBox(
                            width: 35,
                            height: 35,
                            child: Image.asset("images/iconperson.png"),
                          ),
                        ),
                        title: Text(
                          'username',
                          style: TextStyle(fontSize: 13),
                        ),
                        subtitle: Text(
                          'location',
                          style: TextStyle(fontSize: 11),
                        ),
                        trailing: Icon(Icons.more_horiz_outlined),
                      ),
                    ),
                  ),
                  Container(
                    width: 375,
                    height: 375,
                    child: Image.asset(
                      'images/post.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Container(
                    width: 375,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 14,
                        ),
                        Row(
                          
                          children: [
                            SizedBox(
                              width: 14,
                            ),
                            const Icon(
                              Icons.favorite_border_outlined,
                              size: 28,
                            ),
                            SizedBox(
                              width: 17,
                            ),
                            Image.asset(
                              'images/Comment.png',
                              height: 26,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 17,
                            ),
                            Image.asset(
                              'images/Messanger.png',
                              height: 26,
                              color: Colors.black,
                            ),
                            const Spacer(),
                            Icon(Icons.turned_in_not,size: 33,)
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 320),
                          child: Text("0",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
                        ),
                      const Row(
                        children: [
                          Text('username ' + ' ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                          Text('caption',style: TextStyle(fontSize: 13),)
                        ],
                      ),
                      SizedBox(height: 10,),
                     Row(
                       children: [
                         const Text('dateformat',style: TextStyle(fontSize:11,color: Colors.grey ),),
                       ],
                     )
                      ],
                    ),
                  )
                ],
              );
  }
}
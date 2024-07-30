import 'package:flutter/material.dart';

class AddRellsScren extends StatefulWidget {
  const AddRellsScren({super.key});

  @override
  State<AddRellsScren> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddRellsScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Add rels'),
      ),
    );
  }
}
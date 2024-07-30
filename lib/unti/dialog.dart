import 'package:flutter/material.dart';

Future<void> dialogBuilder(BuildContext context, String massage) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Eror',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          content: Text(
            massage,
            style: const TextStyle(fontSize: 20),
          ),
          actions: [
            TextButton(onPressed: (){
Navigator.of(context).pop();
            }, child: Text('Ok'))
          ],
        );
      });
}

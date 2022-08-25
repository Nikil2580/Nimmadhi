import 'package:flutter/material.dart';

class BC3 extends StatefulWidget {
  const BC3({super.key});

  @override
  State<BC3> createState() => _BC1State();
}

class _BC1State extends State<BC3> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text("Use “I feel” statements"),
            ),
            body: Container(
              child: Center(
                  child: Text(
                      'When you have processed your core emotions and other underlying feelings, it may be time to talk to the other person and when you do prioritize "I feel" statement.\nTo let the other person know what you are going through')),
            )));
  }
}

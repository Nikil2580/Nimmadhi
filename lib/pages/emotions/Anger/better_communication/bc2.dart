import 'package:flutter/material.dart';

class BC2 extends StatefulWidget {
  const BC2({super.key});

  @override
  State<BC2> createState() => _BC2State();
}

class _BC2State extends State<BC2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Write it out"),
        ),
        body: Container(
          child: Center(
              child: Text(
                  'If you find yourself consistently angry, it may be a good idea to journal every night before bed to ensure emotional health')),
        ),
      ),
    );
    ;
  }
}

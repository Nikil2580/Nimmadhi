import 'package:flutter/material.dart';

class BC1 extends StatefulWidget {
  const BC1({super.key});

  @override
  State<BC1> createState() => _BC1State();
}

class _BC1State extends State<BC1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Understand your core emotion"),
        ),
        body: Container(
          child: Center(
              child: Text(
                  'A wonderful and healthy way to communicate anger is by thinking “p before s”—processing before speaking.Once you’ve figured out that core emotion it can help you better communicate your feelings.')),
        ),
      ),
    );
  }
}

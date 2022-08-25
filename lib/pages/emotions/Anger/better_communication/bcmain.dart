import 'package:flutter/material.dart';

class BCMAIN extends StatefulWidget {
  const BCMAIN({super.key});

  @override
  State<BCMAIN> createState() => _BCMAINState();
}

class _BCMAINState extends State<BCMAIN> {
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
                      'To express yourself clearly, we suggest  few healthy ways to communicate and process anger.')),
            )));
  }
}

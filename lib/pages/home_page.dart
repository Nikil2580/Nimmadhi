import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:agni/quiz/screens/quiz/welcome_screen.dart';

import '../quiz/screens/quiz/welcome_screen2.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("images/bg.png"),
        fit: BoxFit.cover,
      )),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            SizedBox(height: 50),
            Text(
              'Welcome!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'User',
              style: TextStyle(fontSize: 36),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              elevation: 5,
              child: Container(
                color: Colors.deepPurple[100],
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\"The way I see it, if you want the rainbow, you gotta put up with the rain.\"',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 22,
                              color: Colors.deepPurple[900]),
                        ),
                        Text(
                          '\n-Dolly Parton',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple[900]),
                        ),
                      ]),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Evaluate yourself",
                style: TextStyle(
                  fontSize: 28,
                )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.deepPurple),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          settings: RouteSettings(name: "/WelcomeScreen"),
                          builder: (context) => WelcomeScreen(),
                        ));
                      },
                      child: Text('Anxiety Test')),
                  SizedBox(width: 20),
                  ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.deepPurple),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          settings: RouteSettings(name: "/WelcomeScreen2"),
                          builder: (context) => WelcomeScreen2(),
                        ));
                      },
                      child: Text('Stress Test')),
                ],
              ),
            ),
            // SizedBox(height: 20),
            // Text('Favorites',
            //     style: TextStyle(
            //       fontSize: 28,
            //     )),
            // SizedBox(height: 20),
          ],
        ),
      ),
    ));
  }
}

// ignore_for_file: prefer_const_constructors

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:agni/pages/home_page.dart';
import 'package:agni/pages/notifications_page.dart';
import 'package:agni/pages/profile_page.dart';
import 'package:agni/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class AppRoute extends StatefulWidget {
  AppRoute({Key? key}) : super(key: key);

  @override
  State<AppRoute> createState() => _AppRouteState();
}

class _AppRouteState extends State<AppRoute> {
  // final user = FirebaseAuth.instance.currentUser!;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  // ignore: prefer_final_fields
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    //Text("Add"),
    NotificationsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: GNav(
            padding: const EdgeInsets.all(16),
            iconSize: 22,
            color: Colors.black,
            activeColor: Colors.white,
            backgroundColor: Colors.white,
            // tabMargin: EdgeInsets.symmetric(vertical: 3),
            tabBackgroundGradient: Gradient.lerp(
              LinearGradient(colors: [Colors.indigo, Colors.deepPurple]),
              LinearGradient(colors: [Colors.indigo, Colors.deepPurple]),
              45,
            ),
            gap: 5,
            tabs: const [
              GButton(
                  icon: FlutterRemix.home_2_line,
                  text: 'Home',
                  textColor: Colors.white),
              GButton(
                icon: FlutterRemix.emotion_line,
                text: 'Emotions',
              ),
              // GButton(
              //   icon: FlutterRemix.add_line,
              // ),
              GButton(
                icon: FlutterRemix.heart_3_line,
                text: '0',
              ),
              GButton(
                icon: FlutterRemix.user_3_line,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

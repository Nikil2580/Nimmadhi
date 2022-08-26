import 'package:agni/pages/profile/create_profile.dart';
import 'package:agni/pages/profile/update_profile.dart';
import 'package:agni/utils/get_scores.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserDetails();
  }

  final user = FirebaseAuth.instance.currentUser!;
  Map<String, dynamic>? _userDetails;
  Future<void> _getUserDetails() async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((value) {
      setState(() {
        _userDetails = value.data();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreateProfile()));
        },
        child: Icon(FlutterRemix.pencil_line),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(FlutterRemix.logout_box_r_line),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                color: Colors.black),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Text(
            "Hi there!",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //pfp
              Container(
                height: 100,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Icon(
                    FlutterRemix.account_circle_line,
                    size: 84,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  height: 540,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            '${_userDetails?['first_name']} ${_userDetails?['last_name']}',
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(height: 10),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Text(
                          //       'Followers',
                          //       style: TextStyle(fontWeight: FontWeight.w600),
                          //     ),
                          //     SizedBox(width: 5),
                          //     Text('66'),
                          //     SizedBox(width: 15),
                          //     Text(
                          //       'Following',
                          //       style: TextStyle(fontWeight: FontWeight.w600),
                          //     ),
                          //     SizedBox(width: 5),
                          //     Text('42'),
                          //   ],
                          // ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(FlutterRemix.mail_line, size: 20),
                          SizedBox(width: 5),
                          Text('${user.email}')
                        ],
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          Text(
                            "Your last Anxiety quiz score",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GetScores(quizName: 'anxiety'),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Text(
                            "\nYour last Anxiety quiz score",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GetScores(quizName: 'stress'),
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

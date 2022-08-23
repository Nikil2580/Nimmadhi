import 'package:agni/pages/update_profile.dart';
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
              .push(MaterialPageRoute(builder: (context) => UpdateProfile()));
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
            "Hi ${_userDetails?['user_name']}",
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
                height: 400,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Followers',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(width: 5),
                            Text('69'),
                            SizedBox(width: 15),
                            Text(
                              'Following',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(width: 5),
                            Text('42'),
                          ],
                        ),
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
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(FlutterRemix.github_line, size: 20),
                        SizedBox(width: 5),
                        Text('Github')
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(FlutterRemix.linkedin_box_line, size: 20),
                        SizedBox(width: 5),
                        Text('LinkedIn')
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text('Interests:',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            )),
                        SizedBox(width: 5),
                        Text('Flutter, Web Design, Blockchain, Crypto')
                      ],
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Ideas",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                height: double.infinity,
                                width: 200,
                                color: Colors.white,
                                child: Center(child: Text('Idea ${index}')),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

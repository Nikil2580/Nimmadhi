import 'package:agni/pages/profile/update_firstname.dart';
import 'package:agni/pages/profile/update_lastname.dart';
import 'package:agni/pages/profile/update_username.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Text(
            'Update Profile',
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
          child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.grey[100]),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: _userDetails?['user_name'] == null
                            ? Text('None')
                            : Text(_userDetails?['user_name']),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UpdateUserName()));
                      },
                      color: Colors.indigo,
                      child: Text('Update UserName'))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: _userDetails?['first_name'] == null
                        ? Text("None")
                        : Text(_userDetails?['first_name']),
                  ),
                  SizedBox(width: 10.0),
                  MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UpdateFirstName()));
                      },
                      color: Colors.indigo,
                      child: Text('Update FirstName'))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.grey[100]),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: _userDetails?['last_name'] == null
                            ? Text('None')
                            : Text(_userDetails?['last_name']),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UpdateLastName()));
                      },
                      color: Colors.indigo,
                      child: Text('Update LastName'))
                ],
              )
            ]),
      )),
    );
  }
}

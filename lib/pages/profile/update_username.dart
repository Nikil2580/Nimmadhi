import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class UpdateUserName extends StatefulWidget {
  const UpdateUserName({super.key});

  @override
  State<UpdateUserName> createState() => _UpdateUserNameState();
}

class _UpdateUserNameState extends State<UpdateUserName> {
  @override
  Widget build(BuildContext context) {
    final _userNameController = TextEditingController();
    final user = FirebaseAuth.instance.currentUser!;

    Future updateUserName(String userName) async {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({
        'user_name': userName,
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Text(
            'Update User Name',
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
            SizedBox(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo),
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'Username',
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),
            ),
            MaterialButton(
                onPressed: () =>
                    updateUserName(_userNameController.text.trim()),
                color: Colors.indigo,
                child: Text("Update User Name")),
          ],
        ),
      )),
    );
  }
}

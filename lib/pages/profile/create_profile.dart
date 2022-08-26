import 'package:awesome_number_picker/awesome_number_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  int _ageController = 1;
  final user = FirebaseAuth.instance.currentUser!;
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void newProfile() {
    FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'first_name': _firstNameController.text.trim(),
      'last_name': _lastNameController.text.trim(),
      'age': _ageController
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Center(
              child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Hello, There",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                )),
            SizedBox(height: 30),
            //e-mail
            SizedBox(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo),
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'First Name',
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),
            ),
            //password
            SizedBox(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo),
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'Last Name',
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),
            ),
            //confirm-password
            SizedBox(
                child: Text(
              "Age",
              style: TextStyle(fontWeight: FontWeight.w600),
            )),
            SizedBox(
                height: 150,
                width: 300,
                child: IntegerNumberPicker(
                  axis: Axis.horizontal,
                  initialValue: 15,
                  minValue: 1,
                  maxValue: 100,
                  onChanged: (val) => {
                    setState(() {
                      _ageController = val;
                    })
                  },
                  pickedItemTextStyle: TextStyle(color: Colors.deepPurple),
                  otherItemsDecoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.1),
                        blurRadius: 20.0, // soften the shadow
                        spreadRadius: 0.0, //extend the shadow
                      )
                    ],
                  ),
                  pickedItemDecoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(.5),
                        blurRadius: 20.0, // soften the shadow
                        spreadRadius: 0.0, //extend the shadow
                      )
                    ],
                  ),
                )),

            SizedBox(height: 10),
            //sign-in
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    newProfile();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(20),
                    elevation: 0,
                    primary: Colors.indigo,
                  ),
                  child: Text('Proceed'),
                ),
              ),
            ),
          ],
        ),
      ))),
    );
  }
}

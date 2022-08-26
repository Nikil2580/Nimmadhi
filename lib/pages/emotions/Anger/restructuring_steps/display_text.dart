import 'package:agni/pages/design_course_app_theme.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayText extends StatefulWidget {
  DisplayText({super.key, required this.steps});
  final String steps;

  @override
  State<DisplayText> createState() => _DisplayTextState();
}

class _DisplayTextState extends State<DisplayText> {
  final user = FirebaseAuth.instance.currentUser!;
  late final DocumentReference _notesStream =
      FirebaseFirestore.instance.collection('notes').doc(user.uid);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: _notesStream.get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            ),
          );
        }
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        if (data[widget.steps] == null) {
          return Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Expanded(
                    child: Text(
                      "No notes added",
                      style: GoogleFonts.rubik(
                          color: DesignCourseAppTheme.dark_grey),
                    ),
                  ),
                ),
              ))
            ],
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: data[widget.steps].length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          elevation: 10,
                          child: Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              data[widget.steps][index],
                              style: GoogleFonts.rubik(
                                  color: DesignCourseAppTheme.grey),
                              overflow: TextOverflow.visible,
                            ),
                          ))),
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

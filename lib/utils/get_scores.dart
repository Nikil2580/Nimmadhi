import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../pages/design_course_app_theme.dart';

class GetScores extends StatefulWidget {
  const GetScores({super.key, required this.quizName});
  final String quizName;

  @override
  State<GetScores> createState() => _GetScoresState();
}

class _GetScoresState extends State<GetScores> {
  final user = FirebaseAuth.instance.currentUser!;
  late final DocumentReference _scoreStream =
      FirebaseFirestore.instance.collection('quiz').doc(user.uid);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: _scoreStream.get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Data does not exist");
          }

          if (snapshot.connectionState != ConnectionState.done) {
            return SimpleCircularProgressBar(
              progressColors: const [Colors.deepPurple],
            );
          }
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          if (data[widget.quizName] == null) {
            return (Text("Take the quiz to view Scores"));
          } else {
            return (Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                elevation: 10,
                child: Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    data[widget.quizName][data[widget.quizName].length - 1],
                    style: GoogleFonts.rubik(color: DesignCourseAppTheme.grey),
                    overflow: TextOverflow.visible,
                  ),
                ))));
          }
        });
  }
}

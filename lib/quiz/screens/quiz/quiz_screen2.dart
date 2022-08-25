import 'package:agni/quiz/screens/quiz/components/body2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agni/quiz/controllers/question_controller2.dart';

import 'components/body.dart';

class QuizScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController2 _controller = Get.put(QuestionController2());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(onPressed: _controller.nextQuestion, child: Text("Skip")),
        ],
      ),
      body: Body2(),
    );
  }
}

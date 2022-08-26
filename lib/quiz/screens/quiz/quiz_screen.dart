import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agni/quiz/controllers/question_controller.dart';
import 'package:agni/quiz/screens/quiz/score_screen.dart';
import 'welcome_screen.dart';

import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WelcomeScreen _welcomeScreen = Get.put(WelcomeScreen());
    QuestionController _controller = Get.put(QuestionController());

    //ScoreScreen _scoreScreen = Get.put(ScoreScreen());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          ElevatedButton(
              onPressed: () {
                _welcomeScreen.count += 1;
                _controller.nextQuestion();
              },
              child: const Text("Skip")),
        ],
      ),
      body: Body(),
    );
  }
}

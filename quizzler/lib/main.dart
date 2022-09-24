import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> answerLog = [];

  QuizBrain quizBrain = QuizBrain();
  void checkAnswer(bool choosenAnswer) {
    bool correctAnswer = quizBrain.getAnswerBool();
    if (quizBrain.isFinished() == true) {
      //TODO Step 4 Part A - show an alert using rFlutter_alert,

      //This is the code for the basic alert from the docs for rFlutter Alert:
      //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

      //Modified for our purposes:
      Alert(
        context: context,
        title: 'Finished!',
        desc: 'You\'ve reached the end of the quiz.',
      ).show();

      //TODO Step 4 Part C - reset the questionNumber,
      quizBrain.reset();

      //TODO Step 4 Part D - empty out the scoreKeeper.
      answerLog = [];
    }

    //TODO: Step 6 - If we've not reached the end, ELSE do the answer checking steps below 👇
    else {
      setState(() {
        if (correctAnswer == choosenAnswer) {
          answerLog.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          answerLog.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }

        quizBrain.nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(166, 0, 255, 8),
              ),
              onPressed: () {
                checkAnswer(true);
              },
              child: const Text('True'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(135, 255, 0, 76),
              ),
              onPressed: () {
                checkAnswer(false);
              },
              child: const Text('False'),
            ),
          ),
        ),
        Row(
          children: answerLog,
        )
      ],
    );
  }
}

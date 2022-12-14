import 'question.dart';

int _questionNumber = 0;

class QuizBrain {
  final List<Question> _questionBank = [
    Question('You can lead a cow down stairs but not up stairs?', false),
    Question('Approximately one quarter of human bones are in the feet?', true),
    Question('A slug\'s blood is green?', true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getAnswerBool() {
    return _questionBank[_questionNumber].answerBool;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      //TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  //TODO: Step 4 part B - Create a reset() method here that sets the questionNumber back to 0.
  void reset() {
    _questionNumber = 0;
  }
}

import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
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
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    if (userPickedAnswer == correctAnswer) {
      scoreKeeper.add(Icon(Icons.check, color: Colors.green,));
    } else {
       scoreKeeper.add(Icon(Icons.close, color: Colors.red,));
    }

    // masalahnya ngga bisa nge setstate
    setState(() {
      quizBrain.nextQuestion();
    });
  }

  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.'
  //       'Approximately one quarter of human bones are in the feet.'
  //       'A slug\'s blood is green.'
  // ];

  // List<bool> answers = [
  //   false,
  //   true,
  //   true,
  // ];

  // Question q1 = Question(
  //     q: 'You can lead a cow down stairs but not up stairs.', a: false);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                // questions[questionNumber],
                // questions.first,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                  checkAnswer(true);
                  // bool correctAnswer = answers[questionNumber];

                  // correctAnswer = quizBrain
                  //     .questionBank[questionNumber].questionAnswer = true;
                },
                child: Text(
                  "True",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              )),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                  // bool correctAnswer = answers[questionNumber];
                  checkAnswer(false);
                },
                child: Text(
                  "False",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              )),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_quiz_app/answer.dart';
import 'package:my_quiz_app/question.dart';
import 'package:my_quiz_app/quiz.dart';
import 'package:my_quiz_app/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'whats your fav color?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'blue', 'score': 5},
        {'text': 'red', 'score': 2},
        {'text': 'pink', 'score': 3},
      ],
    },
    {
      'questionText': 'whats your fav animal?',
      'answers': [
        {'text': 'cat', 'score': 10},
        {'text': 'dog', 'score': 5},
        {'text': 'mouse', 'score': 2},
        {'text': 'rabbit', 'score': 3},
      ],
    },
    {
      'questionText': 'whats your fav food?',
      'answers': [
        {'text': 'pizza', 'score': 10},
        {'text': 'pasta', 'score': 5},
        {'text': 'nodel', 'score': 2},
        {'text': 'stake', 'score': 3},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {});
    _questionIndex = 0;
    _totalScore = 0;
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('we have more');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My Quiz App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  questions: _questions,
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex)
              : Result(_totalScore, _resetQuiz)),
    );
  }
}

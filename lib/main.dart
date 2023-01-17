import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_quiz_app/answer.dart';
import 'package:my_quiz_app/question.dart';

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
  final questions = const [
    {
      'questionText': 'whats your fav color?',
      'answers': ['black', 'red', 'green', 'white'],
    },
    {
      'questionText': 'whats your fav animal?',
      'answers': ['rabbit', 'snake', 'cat', 'dog']
    },
    {
      'questionText': 'whats your fav food?',
      'answers': ['pasta', 'pizza', 'soshi', 'dog']
    },
  ];
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < questions.length) {
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
        body: Column(children: [
          Question(questions[_questionIndex]['questionText'] as String),
          ...(questions[_questionIndex]['answers'] as List<String>)
              .map((answer) {
            return Answer(_answerQuestion, answer);
          }).toList()
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'whats your favoritre color',
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 5},
        {'text': 'Red', 'score': 3},
        {'text': 'White', 'score ': 1}
      ]
    },
    {
      'questionText': 'whats your favoritre Animal',
      'answer': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Cat', 'score': 10},
        {'text': 'Dog', 'score': 5},
        {'text': 'Fish', 'score': 1}
      ],
    },
    {
      'questionText': 'whats your favoritre food',
      'answer': [
        {'text': 'Bugger', 'score': 3},
        {'text': 'Pizza', 'score': 10},
        {'text': 'Pasta', 'score': 5},
        {'text': 'Pie', 'score': 1}
      ],
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                'My First App',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
              backgroundColor: Colors.white,
            ),
            body: _questionIndex < _questions.length
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questions: _questions,
                    index: _questionIndex,
                  )
                : Result(_totalScore, _resetQuiz)));
  }
}

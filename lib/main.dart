import 'package:flutter/material.dart';
import 'question.dart';
import 'question_brain.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Quiz(),
          ),
        ),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {


  // List for score
  List<Widget> ScoreKeeper = [];

  QuestionBrain q = QuestionBrain();

  void validateQuestion(bool inputAnswer)
  {
    if(q.getCorrectAnswer()==inputAnswer)
      {
        ScoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      }
    else
      {
        ScoreKeeper.add(
          Icon(
            Icons.clear,
            color: Colors.red,
          ),
        );
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
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                q.getQuestion(),
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
            padding: EdgeInsets.all(20.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'TRUE',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(
                  () {
                    validateQuestion(true);
                    q.getNextQuestion();
                  },
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text(
                'FALSE',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(
                  () {
                    validateQuestion(false);
                    q.getNextQuestion();
                  },
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 10.0),
          child: Row(
            children: ScoreKeeper,
          ),
        )
      ],
    );
  }
}

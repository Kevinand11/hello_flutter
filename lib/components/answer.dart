import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function _buttonPressHandler;
  final String _answer;

  Answer(this._answer, this._buttonPressHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      width: double.infinity,
      child: RaisedButton(
        child: Text('$_answer'),
        textColor: Colors.white,
        color: Colors.green[400],
        onPressed: _buttonPressHandler,
      ),
    );
  }
}

class Result extends StatelessWidget {
  final String question;
  final String answer;

  Result(this.question, this.answer);

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Column(
        children: <Widget>[
          Text(question, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.grey)),
          Text(answer, textAlign: TextAlign.center, style: TextStyle(fontSize: 20))
        ],
      ),
    )
  );
}

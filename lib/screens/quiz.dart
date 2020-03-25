import 'package:flutter/material.dart';

import 'package:helloworld/components/question.dart';
import 'package:helloworld/components/answer.dart';
import 'package:helloworld/components/drawer.dart';

class QuizScreen extends StatefulWidget {
	final String title;

	QuizScreen({Key key, this.title}) : super(key: key);

	@override
	_QuizPageScreen createState() => _QuizPageScreen();
}

class _QuizPageScreen extends State<QuizScreen> {
	int questionIndex = 0;
	List<Map<String, dynamic>> questions = Questions.getAllQuestions();
	List<String> answers = [];

	void setQuestionIndex(int index) {
		setState(() {
			questionIndex = index;
		});
	}

	void nextQuestion(BuildContext context, String answer){
    setState(() {
				answers.add(answer);
			});
		if(questionIndex < questions.length - 1){
			setState(() {
				questionIndex++;
			});
			return;
		}else{
			Navigator.pushNamed(context, 'Answers', arguments: {
				'answers': answers
			});
		}
	}

	@override
	Widget build(BuildContext context) => Scaffold(
		appBar: AppBar(title: Text(widget.title)),
		drawer: AppDrawer(),
		body: Center(
			child: Column(
				mainAxisAlignment: MainAxisAlignment.start,
				children: <Widget>[
					Question(questions[questionIndex]['question']),
					Column(
						crossAxisAlignment: CrossAxisAlignment.center,
						children:
							(questions[questionIndex]['answers'] as List<String>)
								.map((answer) => Answer(answer, (){nextQuestion(context, answer);}))
								.toList()
					)
				]
			)
		)
	);
}

import 'package:flutter/material.dart';

import 'package:helloworld/components/drawer.dart';
import 'package:helloworld/components/answer.dart';
import 'package:helloworld/components/question.dart';

class AnswersScreen extends StatefulWidget {
	final String title;
	final List<String> answers;

	AnswersScreen({Key key, this.title, this.answers}) : super(key: key);

	@override
	_AnswersPageScreen createState() => _AnswersPageScreen(this.answers);
}

class _AnswersPageScreen extends State<AnswersScreen> {
	final List<String> answers;
	final List<Map<String, dynamic>> questions = Questions.getAllQuestions();

	_AnswersPageScreen(this.answers);

	@override
	Widget build(BuildContext context) => Scaffold(
			appBar: AppBar(title: Text(widget.title)),
			drawer: AppDrawer(),
			body: Center(
				child: Column(
					children: [
						...(answers.map((answer) => Result('${questions[answers.indexOf(answer)]['question']} :',answer)).toList()),
						Padding(
						padding: const EdgeInsets.all(8.0),
						child: FlatButton(
							child: Text('Restart Quiz',
									style: TextStyle(
										color: Colors.blue[300]
									),
								),
							onPressed: () => Navigator.pushNamed(context, 'Quiz'),
						),
					)
				]
			)
		)
	);
}

import 'package:flutter/material.dart';

class Question extends StatelessWidget {
	final String question;

	Question(this.question);

	@override
	Widget build(BuildContext context) {
		return Container(
			width: double.infinity,
			padding: EdgeInsets.all(10),
			child: Text(
				question,
				textAlign: TextAlign.center,
				style: TextStyle(
					fontSize: 24
				)
			)
		);
	}
}

class Questions{
	static List<Map<String, dynamic>> getAllQuestions(){
		return  [
			{
				'id': 0,
				'question': 'What\'s your favourite color?',
				'answers': ['Black', 'Blue', 'Pink', 'Yellow']
			},
			{
				'id': 1,
				'question': 'What\'s your favourite animal?',
				'answers': ['Bird', 'Dog', 'Cat', 'Rabbit']
			},
			{
				'id': 2,
				'question': 'Who\'s your favourite youtube instructor?',
				'answers': ['Udemy\'s Maximoff', 'Brad Traversky', 'Adobe\'s John', 'Tech With Tim']
			}
		];
	}
}
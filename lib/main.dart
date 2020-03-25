import 'package:flutter/material.dart';
import 'package:helloworld/screens/home.dart';
import 'package:helloworld/screens/login.dart';
import 'package:helloworld/screens/answers.dart';
import 'package:helloworld/screens/http.dart';
import 'package:helloworld/screens/quiz.dart';
import 'package:helloworld/screens/shapes.dart';
import 'package:helloworld/screens/platform.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) => MaterialApp(
		title: 'Hello FLutter',
		theme: ThemeData(primarySwatch: Colors.red),
		initialRoute: 'Login',
		onGenerateRoute: _generateRoutes(),
	);

	RouteFactory _generateRoutes() {
		return (settings) {
		final Map<String, dynamic> arguments = settings.arguments;
		Widget screen;
		switch (settings.name) {
			case 'Quiz':
				screen = QuizScreen(title: 'Quiz');
				break;
			case 'Login':
				screen = LoginScreen(title: 'Login');
				break;
			case 'Answers':
				screen = AnswersScreen(title: 'Answers', answers: arguments['answers']);
				break;
			case 'Shapes':
				screen = ShapeScreen(title: 'Shapes');
				break;
			case 'Http':
				screen = HttpScreen(title: 'Http');
				break;
			case 'Platform':
				screen = PlatformScreen(title: 'Platform');
				break;
			case 'Platform':
				screen = PlatformScreen(title: 'Platform');
				break;
			case 'Home':
				screen = HomeScreen(title: 'Home');
				break;
			default:
				screen = HomeScreen(title: 'Home');
				break;
		}
		return MaterialPageRoute(builder: (BuildContext context) => screen);
		};
	}
}

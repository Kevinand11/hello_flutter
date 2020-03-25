import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget{

	void navigateTo(BuildContext context, String route){
		Navigator.pushNamed(context, route);
	}

	@override
	Widget build(BuildContext context) => Drawer(
		child: ListView(
			children: <Widget>[
				UserAccountsDrawerHeader(
					accountName: Text('Anonymous'),
					accountEmail: Text('johndoe@gmail.com'),
					currentAccountPicture: Center(
						child: GestureDetector(
							child: CircleAvatar(
								backgroundColor: Colors.grey,
								child: Icon(Icons.person, color:Colors.white)
							)
						)
					),
				),
				InkWell(
					onTap: (){this.navigateTo(context, 'Home');},
					child: ListTile(
						title: Text('Home'),
						leading: Icon(Icons.home),
					),
				),
				InkWell(
					onTap: (){this.navigateTo(context, 'Quiz');},
					child: ListTile(
						title: Text('Quiz'),
						leading: Icon(Icons.question_answer),
					),
				),
				InkWell(
					onTap: (){this.navigateTo(context, 'Shapes');},
					child: ListTile(
						title: Text('Shapes'),
						leading: Icon(Icons.format_shapes),
					),
				),
				Divider(),
				InkWell(
					onTap: (){this.navigateTo(context, 'Http');},
					child: ListTile(
						title: Text('Http Requests'),
						leading: Icon(Icons.computer),
					),
				),
				InkWell(
					onTap: (){this.navigateTo(context, 'Platform');},
					child: ListTile(
						title: Text('Platform'),
						leading: Icon(Icons.phone_android),
					),
				),
        Divider(),
				InkWell(
					onTap: (){this.navigateTo(context, 'Login');},
					child: ListTile(
						title: Text('Login'),
						leading: Icon(Icons.exit_to_app),
					),
				),
			],
		)
	);
}

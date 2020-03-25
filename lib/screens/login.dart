import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:helloworld/components/drawer.dart';

class LoginScreen extends StatefulWidget {
	final String title;

	LoginScreen({Key key, this.title}) : super(key: key);

	@override
	_LoginPageScreen createState() => _LoginPageScreen();
}

class _LoginPageScreen extends State<LoginScreen> {
	bool visible = false;

	@override
	Widget build(BuildContext context) => Scaffold(
		appBar: AppBar(title: Text(widget.title)),
		drawer: AppDrawer(),
		body: Padding(
			padding: EdgeInsets.all(20),
			child: ListView(
				scrollDirection: Axis.vertical,
				children: <Widget>[
					Icon(
						Icons.account_box,
						color: Theme.of(context).primaryColor,
						size: 150,
					),
					Padding(
						padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
						child: TextFormField(
						keyboardType: TextInputType.emailAddress,
						decoration: InputDecoration(
							hintText: 'Username',
							border: OutlineInputBorder(),
							focusColor: Colors.blue,
							prefixIcon: Icon(Icons.account_circle)),
						),
					),
					Padding(
						padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
						child: TextFormField(
						keyboardType: TextInputType.visiblePassword,
						obscureText: visible ? false : true,
						decoration: InputDecoration(
							hintText: 'Password',
							border: OutlineInputBorder(),
							suffix: InkWell(
								child: Icon(
								visible ? Icons.visibility_off : Icons.visibility),
								onTap: () => setState(() => visible = !visible),
							),
							prefixIcon: Icon(Icons.lock)),
						),
					),
					Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
							Text('Forgot Password? ', style: TextStyle(fontSize: 14)),
							InkWell(
								onTap: () {},
								child: Text(
									'Reset',
									style: TextStyle(fontSize: 14, color: Colors.blue[500]),
								),
							)
						],
					),
					Padding(
						padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
						child: RaisedButton(
							onPressed: () =>Navigator.pushNamed(context, 'Home'),
							color: Colors.red,
							child: Text(
								'Login',
								style: TextStyle(color: Colors.white),
							),
						),
					),
					Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
							Text('Not a member yet? ', style: TextStyle(fontSize: 14)),
							InkWell(
								onTap: () {},
								child: Text(
									'Proceed to register',
									style: TextStyle(fontSize: 14, color: Colors.blue[500]),
								),
							)
						],
					),
				],
			)
		)
	);
}

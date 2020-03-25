import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helloworld/components/drawer.dart';
import 'package:helloworld/components/user.dart';
import 'package:http/http.dart' as http;

class HttpScreen extends StatefulWidget {
	final String title;
	final List<String> answers;

	HttpScreen({Key key, this.title, this.answers}) : super(key: key);

	@override
	_HttpScreen createState() => _HttpScreen();
}

class _HttpScreen extends State<HttpScreen> {
	Map<String, dynamic> metadata;
	List<dynamic> users = [];
	bool loading = false;

	void goOnline() async {
		setState(() => loading = true);
		var response = await http.get('http://localhost:8000/api/v1/users');
		setState(() {
			metadata = jsonDecode(response.body);
			users = metadata['data'];
			loading = false;
		});
	}

	@override
	void initState() {
		super.initState();
		goOnline();
	}

	@override
	Widget build(BuildContext context) => Scaffold(
		appBar: AppBar(title: Text(widget.title)),
		drawer: AppDrawer(),
		body: loading ? Center(
			child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: <Widget>[
					CircularProgressIndicator(
						backgroundColor: Colors.blue[500],
					)
				],
			),
		) : Center(
			child: ListView(
				children: users .map((user) => User(user: UserModel.fromData(user))).toList(),
			)
		),
		bottomNavigationBar: Container(
			color: Colors.black54,
			child: Row(
				mainAxisAlignment: MainAxisAlignment.center,
				children: <Widget>[
					IconButton(icon: Icon(Icons.refresh,color: Colors.white), onPressed: goOnline)
				],
			),
		),
	);
}

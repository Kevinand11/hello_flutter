import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helloworld/components/drawer.dart';

class HomeScreen extends StatefulWidget {
	final String title;
	HomeScreen({Key key, this.title}) : super(key: key);

	@override
	_HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
	int _index = 0;

	@override
	Widget build(BuildContext context) => Scaffold(
		appBar: AppBar(
			title: Text(widget.title),
		),
		drawer: AppDrawer(),
		body: GridView.count(
			primary: false,
			padding: EdgeInsets.all(16),
			crossAxisSpacing: 10,
			mainAxisSpacing: 10,
			crossAxisCount: 2,
			children: <Widget>[
				card(
					icon: FontAwesomeIcons.aws,
					name: 'Amazon'
				),
				card(
					icon: FontAwesomeIcons.microsoft,
					name: 'Microsoft'
				),
				card(
					icon: FontAwesomeIcons.apple,
					name: 'Apple'
				),
				card(
					icon: FontAwesomeIcons.adobe,
					name: 'Adobe'
				),
				card(
					icon: FontAwesomeIcons.youtube,
					name: 'Youtube'
				),
				card(
					icon: FontAwesomeIcons.yelp,
					name: 'Yelp'
				),
				card(
					icon: FontAwesomeIcons.facebook,
					name: 'Facebook'
				),
				card(
					icon: FontAwesomeIcons.twitter,
					name: 'Twitter'
				),
				card(
					icon: FontAwesomeIcons.behance,
					name: 'Behance'
				),
				card(
					icon: FontAwesomeIcons.dribbble,
					name: 'Dribbble'
				),
				card(
					icon: FontAwesomeIcons.viber,
					name: 'Viber'
				),
			],
		),
		bottomNavigationBar: BottomNavigationBar(
			type: BottomNavigationBarType.fixed,
			items: [
				BottomNavigationBarItem(
					icon: Icon(Icons.home), title: Text('Home')
				),
				BottomNavigationBarItem(
					icon: Icon(Icons.camera_alt), title: Text('Camera')
				),
				BottomNavigationBarItem(
					icon: Icon(Icons.filter), title: Text('Saved')
				),
				BottomNavigationBarItem(
					icon: Icon(Icons.more_horiz), title: Text('More')
				),
			],
			currentIndex: _index,
			onTap: (index) => setState(() => _index = index),
		),
	);

	Widget card({String name, IconData icon}) => ClipRRect(
		borderRadius: BorderRadius.all(Radius.circular(10)),
		child: Card(
			elevation: 5,
			child: Padding(
				padding: EdgeInsets.fromLTRB(8,16,8,16),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.center,
					children: <Widget>[
						Icon(icon, color: Theme.of(context).primaryColor,size: 50),
						SizedBox(height:10),
						Text(name, style: Theme.of(context).textTheme.headline),
						Padding(
							padding: EdgeInsets.symmetric(horizontal: 8),
							child: Row(
								mainAxisAlignment: MainAxisAlignment.spaceAround,
								children: <Widget>[
									RaisedButton(
										onPressed: (){},
										child: Text('Add To Cart')
									),
									Icon(FontAwesomeIcons.heart, color: Colors.grey)
								]
							),
						)
					]
				),
			),
		),
	);
}
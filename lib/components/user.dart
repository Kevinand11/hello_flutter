import 'package:flutter/material.dart';

class User extends StatefulWidget {
  final UserModel user;

  User({this.user});

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
        leading: Icon(Icons.account_circle),
        title: Text(widget.user.name),
        subtitle: Text(widget.user.email),
        trailing: Icon(Icons.arrow_drop_down),
      )
    );
  }
}

class UserModel {
  String name, email;
  int id;
  dynamic phone;

  UserModel({this.id, this.name, this.email, this.phone});
  UserModel.fromData(Map<String, dynamic> user) {
    this.name = user['name'];
    this.email = user['email'];
    this.id = user['id'];
    this.phone = user['phone'];
  }
}

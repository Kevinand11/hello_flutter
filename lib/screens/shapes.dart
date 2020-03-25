import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:math';

import 'package:helloworld/components/drawer.dart';

class ShapeScreen extends StatefulWidget {
  final String title;

  ShapeScreen({Key key, this.title}) : super(key: key);

  @override
  _ShapePageScreen createState() => _ShapePageScreen();
}

class _ShapePageScreen extends State<ShapeScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: AppDrawer(),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Text('Nothing to show. View source code for Shape abstract class and its inheritor classes'),
        ),
      );
}

abstract class Shape {
  double area();
  double perimeter();
}

class Circle extends Shape {
  final double radius;

  Circle({@required this.radius});

  double get diameter => this.radius * 2;

  @override
  double area() => pi * pow(radius, 2);

  @override
  double perimeter() => pi * 2 * radius;
}

class Rectangle extends Shape {
  final double length, width;

  Rectangle({@required this.length, @required this.width});

  @override
  double area() => this.length * this.width;

  @override
  double perimeter() => 2 * this.length + 2 * this.width;
}

class Square extends Rectangle {
  double length;

  Square({@required this.length});

  double get width => this.length;

  @override
  double area() => pow(this.length, 2);

  @override
  double perimeter() => 4 * this.length;
}

class Triangle extends Shape {
  final double height, base;
  final String type;

  Triangle({@required this.height, @required this.base, @required this.type});

  @override
  double area() {
    return 0.5 * this.base * this.height;
  }

  @override
  double perimeter() {
    switch (this.type) {
      case 'ISOSCELES':
        double equalSides =
            this.base / cos(atan(this.base / (2 * this.height)));
        return this.base + 2 * equalSides;
        break;
      case 'EQUILATERAL':
        return 3 * this.base;
        break;
      case 'SCALENE':
        // Keeping the constructors of the triangle as simple as possible makes it hard to find the perimeter of a scalene triangle
        return double.infinity;
        break;
      default:
        return 3 * this.base;
        break;
    }
  }
}

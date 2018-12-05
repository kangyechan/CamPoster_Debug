import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final schoolName;

  HomePage({Key key, @required this.schoolName}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(schoolName: schoolName);
}

class _HomePageState extends State<HomePage> {
  String schoolName;

  _HomePageState({Key key, @required this.schoolName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(schoolName),
    );
  }
}
import 'dart:io';

import 'package:camposter_debug/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPosterPage extends StatefulWidget {
  String category;

  AddPosterPage({Key key, @required this.category}) : super(key: key);

  @override
  _AddPosterPageState createState() => _AddPosterPageState(category: category);
}

class _AddPosterPageState extends State<AddPosterPage> {
  final _posterNameController = TextEditingController();
  final _posterOrganizerController = TextEditingController();
  final _timeLocationController = TextEditingController();
  final _tagController = TextEditingController();

  _AddPosterPageState({Key key, @required this.category});

  SharedPreferences prefs;

  String category;
  String userId;
  File _imageFile;
  String imageURL;
  String schoolName;
  FirebaseStorage storage = FirebaseStorage.instance;
  double spinKitState = 0.0;

  @override
  void initState() {
    super.initState();
    _getCurrentUserId(context);
    getSchoolName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: _buildAppBar(
//
//      ),
        body: Center(
          child: Text("ggg"),
        ),
//      body: _buildBody(
//
//      ),
    );
  }

  void getSchoolName() async {
    prefs = await SharedPreferences.getInstance();
    schoolName = prefs.getString(SCHOOL_NAME);
    print('add_poster page schoolname: $schoolName');
  }

  void _getCurrentUserId(BuildContext context) {
    FirebaseAuth.instance.onAuthStateChanged.listen((user) {
      if (user != null) {
        setState(() {
          userId = user.uid;
        });
      }
    });
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:camposter_debug/colors.dart';

class LikePage extends StatefulWidget {
  @override
  _LikePageState createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  String userId;

  @override
  void initState() {
    super.initState();
    _getCurrentUserId(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.4,
      backgroundColor: CamPosterBackgroundWhite,
      title: Container(
        padding: EdgeInsets.only(left: 10.0),
        child: Text(
          '좋아하는 포스터',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
//          _buildListView(context),
        ],
      ),
    );
  }

//  Widget _buildListView(BuildContext context) {
//    return Flexible(
//      child: StreamBuilder(
//        stream: Firestore.instance
//            .collection('Users')
//            .document(userId)
//            .snapshots(),
//        builder: (context, snapshot) {
//          if (!snapshot.hasData) return LinearProgressIndicator();
//          if (snapshot.data.documents.length == 0) return emptyLikeList;
//
//          return _buildGridList(context, snapshot.data.documents);
//        },
//      ),
//    );
//  }
//
//  Widget _buildGridList(BuildContext context, List<DocumentSnapshot> snapshot) {
//    return GridView.count(
//      crossAxisCount: 2,
//      padding: EdgeInsets.all(16.0),
//      childAspectRatio: 10.0 / 12.4,
//      children: snapshot.map((data) => _buildGridItem(context, data)).toList(),
//    );
//  }



  showPickerDialog(BuildContext context) {
    Picker(
      adapter: PickerDataAdapter<String>(
        pickerdata: ['공모전', '취업', '신앙', '동아리', '학회', '공연']
      ),
      hideHeader: true,
      title: Text(
        '카테고리',
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
//      onConfirm: (Picker picker, List value) {
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (context) => AddPosterPage(category: picker.getSelectedValues()[0]),
//          ),
//        );
//        print(picker.getSelectedValues());
//      }
    ).showDialog(context);
  }

  var emptyLikeList = Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 120.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/posterdefault.png',
              width: 200.0,
              height: 200.0,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10.0,
      ),
      Text(
        '좋아요 한 포스터가 없습니다.',
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    ],
  );

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

import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';

class CalendarPage extends StatelessWidget {

  void handleNewDate(date) {
    print("handleNewDate ${date}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        backgroundColor: Colors.white,
        title: Container(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            '캘린더',
            style: TextStyle(
              color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 10.0,
        ),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Calendar(
              onSelectedRangeChange: (range) =>
                  print("Range is ${range.item1}, ${range.item2}"),
              isExpandable: true,
              onDateSelected: (date) => handleNewDate(date),
            ),
            Divider(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
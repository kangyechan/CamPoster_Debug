import 'package:camposter_debug/home_calendar.dart';
import 'package:camposter_debug/home_chat.dart';
import 'package:camposter_debug/home_like.dart';
import 'package:camposter_debug/home_main.dart';
import 'package:camposter_debug/home_mypage.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeNavigatorPage extends StatefulWidget {
  String schoolName;
  HomeNavigatorPage({Key key, @required this.schoolName}) : super(key: key);
  @override
  _HomeNavigatorPageState createState() => _HomeNavigatorPageState(schoolName: schoolName);
}

class _HomeNavigatorPageState extends State<HomeNavigatorPage> {

  _HomeNavigatorPageState({Key key, @required this.schoolName});

  String schoolName;
  int currentTab = 0;
  ChatPage chatPage;
  LikePage likePage;
  CalendarPage calendarPage;
  MyPage myPage;
  HomePage homePage;

  Widget currentPage;

  List<Widget> pages;
  List<String> pageTitles;

  @override
  void initState() {
    super.initState();

    chatPage = ChatPage();
    likePage = LikePage();
    homePage = HomePage(schoolName: schoolName,);
    myPage = MyPage();
    calendarPage = CalendarPage();

    pages = [homePage, calendarPage, likePage, chatPage, myPage];
    pageTitles = ["Home", "Calendar", "Like", "Chat", "MyPage"];
    currentPage = homePage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (int index) {
          setState(() {
            currentTab = index;
            currentPage = pages[index];
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("홈", style: TextStyle(fontSize: 12.0))),
          BottomNavigationBarItem(
              icon: Icon(Icons.date_range), title: Text("캘린더", style: TextStyle(fontSize: 12.0))),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Text("좋아요", style: TextStyle(fontSize: 12.0))),
          BottomNavigationBarItem(icon: Icon(Icons.email), title: Text("문의", style: TextStyle(fontSize: 12.0))),
          BottomNavigationBarItem(
              icon: Icon(Icons.face), title: Text("내 정보", style: TextStyle(fontSize: 12.0))),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
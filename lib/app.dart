import 'package:camposter_debug/login.dart';
import 'package:camposter_debug/mypage_setting/setting.dart';
import 'package:camposter_debug/mypage_setting/setting_center.dart';
import 'package:camposter_debug/mypage_setting/setting_notice.dart';
import 'package:camposter_debug/mypage_setting/setting_person.dart';
import 'package:camposter_debug/mypage_setting/setting_push.dart';
import 'package:camposter_debug/mypage_setting/setting_service.dart';
import 'package:camposter_debug/mypage_setting/setting_version.dart';
import 'package:flutter/material.dart';
import 'package:camposter_debug/colors.dart';

class CamPosterApp extends StatelessWidget {

  final primarySwatchColor = const Color(0xFFB52F28);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camposter',
      theme: _buildCamPosterTheme(),
      home: SettingPage(),
      onGenerateRoute: _getRoute,
      routes: {
        '/login': (context) => LoginPage(),
        '/setting': (context) => SettingPage(),
        '/setting_notice': (context) => SettingNoticePage(),
        '/setting_version': (context) => SettingVersionPage(),
        '/setting_person': (context) => SettingPersonPage(),
        '/setting_push': (context) => SettingPushPage(),
        '/setting_service': (context) => SettingServicePage(),
        '/setting_center': (context) => SettingCenterPage(),
      },
    );
  }

  Route<dynamic> _getRoute(RouteSettings setting) {
    if (setting.name != '/login'){
      return null;
    }
    return MaterialPageRoute<void> (
      settings: setting,
      builder: (BuildContext context) => SettingPage(),
      fullscreenDialog: true,
    );
  }
}

ThemeData _buildCamPosterTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: CamPosterRed,
    primaryColor: CamPosterRed,
    scaffoldBackgroundColor: CamPosterBackgroundWhite,
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../AddReminder.dart';
import '../New folder/event_cand.dart';
import 'event_calender.dart';
import 'home_screen_design.dart';
import 'profile.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  static const List<Widget> _pages = <Widget>[
    Home_Screen_Design(),
    EventCalend(),
    AddReminder(),
    //HomePage(),
    Chat_ui(),
    Profile(),
  ];
  var _indexOfIcon = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
    builder: ((controller) =>SafeArea(
      child: Scaffold(
        body: Center(
          child: _pages.elementAt(_indexOfIcon),
        ),
        bottomNavigationBar: BottomNavigationBar(
          mouseCursor: SystemMouseCursors.grab,
          iconSize: 30,
          elevation: 0,
          selectedIconTheme: IconThemeData(color: Color(0xFF008CB6), size: 35),
          selectedItemColor: Color(0xFF008CB6),
          unselectedIconTheme:
              IconThemeData(color: Color(0xFFA1A1A1), size: 30),
          unselectedLabelStyle: TextStyle(
              fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black),
          selectedLabelStyle:
              TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home".tr,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.insert_invitation_rounded),
                label: "Appointement".tr),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.alarm,
                ),
                label: "Reminder".tr),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "Chat".tr,
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Profile".tr),
          ],
          onTap: _tapOnIcon,
          currentIndex: _indexOfIcon,
        ),
      ),
    )));
  }

  void _tapOnIcon(int value) {
    setState(() {
      _indexOfIcon = value;
    });
  }
}

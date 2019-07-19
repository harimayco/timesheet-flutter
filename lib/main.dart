import 'package:AvasoftTimesheet/pages/home_page.dart';
import 'package:AvasoftTimesheet/pages/profile_page.dart';
import 'package:AvasoftTimesheet/pages/stafflist_page.dart';
import 'package:AvasoftTimesheet/pages/timesheet.dart';
import 'package:AvasoftTimesheet/pages/workload_page.dart';
import 'package:flutter/material.dart';
import './pages/login_page.dart';

void main() {
  runApp(
    new MaterialApp(
      title: "Avasoft Timesheet",
      initialRoute: '/login',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/workload': (context) => WorkloadPage(),
        '/staff-list': (context) => StaffListPage(),
        '/timesheet': (context) => TimesheetPage(),
        '/profile': (context) => ProfilePage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(225, 11, 23, 1),
        accentColor: Color.fromRGBO(225, 11, 23, 1),
      ),
    ),
  );
}

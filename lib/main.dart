import 'package:flutter/material.dart';
//import './pages/home_page.dart';
import './pages/login_page.dart';

void main() {
  runApp(
    new MaterialApp(
      title: "Odhier Apps",
      home: new LoginPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(225, 11, 23, 1),
        accentColor: Color.fromRGBO(225, 11, 23, 1),
      ),
    ),
  );
}

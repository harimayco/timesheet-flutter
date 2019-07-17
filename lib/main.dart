import 'package:flutter/material.dart';
import './pages/home_page.dart';

void main() {
  runApp(
    new MaterialApp(
      title: "Odhier Apps",
      home: new HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal[800],
      ),
    ),
  );
}

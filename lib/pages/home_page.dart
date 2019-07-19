import 'package:AvasoftTimesheet/utils/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Avasoft Timesheet"),
          bottom: TabBar(
            labelStyle: TextStyle(fontSize: 15),
            labelPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            //isScrollable: true,
            tabs: <Widget>[
              Text("ALL"),
              Text("THIS MONTH"),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: new Icon(Icons.search),
              onPressed: () {},
            ),
          ],
          //elevation: 5,
        ),
        drawer: MainDrawer(),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Text(
                "Home Page 1",
                style: TextStyle(fontSize: 35.0),
              ),
            ),
            Center(
              child: Text(
                "Home Page 2",
                style: TextStyle(fontSize: 35.0),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

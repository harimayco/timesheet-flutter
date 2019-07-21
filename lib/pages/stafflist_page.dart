import 'package:flutter/material.dart';
import 'package:AvasoftTimesheet/common/serializer/auth.dart';
import 'package:AvasoftTimesheet/common/api.dart';

class StaffListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Staff List"),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Text("Selamat Datang Staff List Page"),
            RaisedButton(
              child: Text("Test"),
              onPressed: () async {
                ApiCall(context).testGet();
              },
            )
          ],
        )));
  }
}

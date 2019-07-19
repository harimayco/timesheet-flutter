import 'package:AvasoftTimesheet/pages/login_page.dart';
import 'package:AvasoftTimesheet/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './other_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String mainProfilePicture = "https://harimayco.github.io/img/foto.jpg";
  String profileBackground =
      "https://img00.deviantart.net/35f0/i/2015/018/2/6/low_poly_landscape__the_river_cut_by_bv_designs-d8eib00.jpg";
  String otherProfilePicture =
      "https://www.jasvidstudio.com/wp-content/uploads/2015/10/RENDY-HARIMAYCO.jpg";

  void switchUser() {
    String backupString = mainProfilePicture;
    this.setState(() {
      mainProfilePicture = otherProfilePicture;
      otherProfilePicture = backupString;
    });
  }

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
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text("Rendy Harimayco"),
                    accountEmail: Text("rendy@avasoft.net"),
                    currentAccountPicture: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context) => new ProfilePage(),
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(mainProfilePicture),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    right: 20,
                    child: RawMaterialButton(
                      padding: EdgeInsets.all(13),
                      child: Icon(Icons.edit),
                      fillColor: Colors.white,
                      shape: CircleBorder(),
                      onPressed: null,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              ListTile(
                title: Text(
                  "Add new Timesheet",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                leading: Icon(
                  Icons.date_range,
                  color: Color.fromRGBO(225, 11, 23, 1),
                  size: 40,
                ),
                onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new OtherPage("Page Workload"),
                  ),
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  "Staff List",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                leading: Icon(
                  Icons.people,
                  color: Color.fromRGBO(225, 11, 23, 1),
                  size: 40,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new OtherPage("Page Staff List"),
                    ),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  "View Summary Workload",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                leading: Icon(
                  Icons.work,
                  color: Color.fromRGBO(225, 11, 23, 1),
                  size: 40,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new OtherPage("Page Summary Workload"),
                    ),
                  );
                },
              ),
              Divider(),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: RaisedButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        elevation: 0,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                        onPressed: () {
                          Navigator.of(context).push(
                            new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new LoginPage(),
                            ),
                          );
                        },
                        color: Colors.grey[600],
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
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

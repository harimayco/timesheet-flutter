import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Avasoft Timesheet"),

        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        //elevation: 5,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Rendy Harimayco"),
              accountEmail: Text("rendy@avasoft.net"),
              currentAccountPicture: GestureDetector(
                onTap: () => print("Gambar profil diklik"),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(mainProfilePicture),
                ),
              ),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                  onTap: () => switchUser(),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(otherProfilePicture),
                  ),
                ),
              ],
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(profileBackground),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ListTile(
              title: Center(
                child: Text(
                  "Welcome to Avasoft Timesheet!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.teal),
                ),
              ),
            ),
            ListTile(
              title: Text("Workload"),
              leading: Icon(Icons.kitchen),
              onTap: () => Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new OtherPage("Page Workload"),
                    ),
                  ),
            ),
            ListTile(
                title: Text("Staff List"),
                leading: Icon(Icons.people),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new OtherPage("Page Staff List"),
                    ),
                  );
                }),
            ListTile(
                title: Text("View Summary Workload"),
                leading: Icon(Icons.work),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new OtherPage("Page Summary Workload"),
                    ),
                  );
                }),
            Divider(),
            ListTile(
                title: Text("Edit Profile"),
                leading: Icon(Icons.edit),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new OtherPage("Edit Profile"),
                    ),
                  );
                }),
            ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.exit_to_app),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          "Home Page",
          style: TextStyle(fontSize: 35.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.teal[800],
      ),
    );
  }
}

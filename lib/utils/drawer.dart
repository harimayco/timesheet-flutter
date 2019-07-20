import 'package:AvasoftTimesheet/pages/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
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
    return Drawer(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Rendy Harimayco"),
                accountEmail: Text("rendy@avasoft.net"),
                currentAccountPicture: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/profile'),
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
                  onPressed: () => Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new EditProfilePage(15),
                    ),
                  ),
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
              onTap: () => Navigator.popAndPushNamed(context, '/timesheet')),
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
              Navigator.popAndPushNamed(context, '/staff-list');
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              "Workload",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            leading: Icon(
              Icons.work,
              color: Color.fromRGBO(225, 11, 23, 1),
              size: 40,
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, '/workload');
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('login', false);
                      Navigator.pushNamed(context, '/login');
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
    );
  }
}

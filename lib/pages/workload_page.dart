import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

class WorkloadPage extends StatelessWidget {
  final workloadTeam = [
    "Anastasia Jeannet",
    "Budi St",
    "Rendy Harimayco",
    "Stefanus Eka",
    "Ryan Linardi"
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Workload"),
          bottom: TabBar(
            labelStyle: TextStyle(fontSize: 15),
            labelPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            isScrollable: true,
            tabs: <Widget>[
              Text("DEVELOPERS"),
              Text("DESIGNERS"),
              Text("SEO"),
              Text("PROJECT MANAGER"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            FutureBuilder(
              future: firstTabBarView2(),
              builder: (BuildContext context, snapshot) {
                // <--- build the things.
                return snapshot.hasData
                    ? snapshot.data
                    : Center(child: Text('loading..'));
              },
            ),
            CustomViewTabs(),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Card(
                  elevation: 2,
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://s3.amazonaws.com/uifaces/faces/twitter/marcoramires/128.jpg"),
                    ),
                    title: Text(
                      'Anastasia Jeannet',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    children: <Widget>[
                      ListTile(title: Text('Title of the item')),
                      ListTile(
                        title: Text('Title of the item2'),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 2,
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://s3.amazonaws.com/uifaces/faces/twitter/stephenmoon/128.jpg"),
                    ),
                    title: Text(
                      'Budi S',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    children: <Widget>[
                      ListTile(title: Text('Title of the item')),
                      ListTile(
                        title: Text('Title of the item2'),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 2,
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://s3.amazonaws.com/uifaces/faces/twitter/bigmancho/128.jpg"),
                    ),
                    title: Text(
                      'Rendy Harimayco',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    children: <Widget>[
                      ListTile(title: Text('Title of the item')),
                      ListTile(
                        title: Text('Title of the item2'),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 2,
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://s3.amazonaws.com/uifaces/faces/twitter/marcoramires/128.jpg"),
                    ),
                    title: Text(
                      'Stefanus EKA',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    children: <Widget>[
                      ListTile(title: Text('Title of the item')),
                      ListTile(
                        title: Text('Title of the item2'),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 2,
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://s3.amazonaws.com/uifaces/faces/twitter/marcoramires/128.jpg"),
                    ),
                    title: Text(
                      'Valerian',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    children: <Widget>[
                      ListTile(title: Text('Title of the item')),
                      ListTile(
                        title: Text('Title of the item2'),
                      )
                    ],
                  ),
                ),
                Card(
                  child: ExpansionTile(
                    leading: Icon(Icons.event),
                    title: Text('Test1'),
                    children: <Widget>[
                      ListTile(title: Text('Title of the item')),
                      ListTile(
                        title: Text('Title of the item2'),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Text("haha"),
          ],
        ),
      ),
    );
  }

  Widget firstTabbarView() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: ExpansionTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://s3.amazonaws.com/uifaces/faces/twitter/marcoramires/128.jpg"),
              ),
              title: Text(
                this.workloadTeam[index],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18),
              ),
              backgroundColor: Colors.white,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                CustomExpandedItem(
                  title: "Carrol Company: Virtuemart Plugin",
                  dueDate: "2018-03-19",
                ),
                CustomExpandedItem(
                  title: "Latinnews: Add new feature to admin page",
                  dueDate: "2019-04-17",
                ),
                CustomExpandedItem(
                  title: "Trabolgan: Email issue",
                  dueDate: "2017-05-05",
                ),
                CustomExpandedItem(
                  title:
                      "Aran Sweater Market: woocommerce & site Performance Issue",
                  dueDate: "2016-07-07",
                ),
              ],
            ),
          ),
        );
      },
      itemCount: workloadTeam.length,
    );
  }

  Future<Widget> firstTabBarView2() {
    return new Future.delayed(
        const Duration(seconds: 3), () => firstTabbarView());
  }
}

class CustomViewTabs extends StatefulWidget {
  @override
  _CustomViewTabsState createState() => _CustomViewTabsState();
}

class _CustomViewTabsState extends State<CustomViewTabs> {
  final workloadTeam = [
    "Stefanny",
    "Adi MF",
    "Ricky Zakaria",
    "Taufik hidayat",
    "Efryan"
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: testingFuture(),
      builder: (BuildContext context, snapshot) {
        // <--- build the things.
        return snapshot.hasData
            ? snapshot.data
            : Center(child: Text('loading..'));
      },
    );
  }

  Widget customBuilder() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: ExpansionTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://s3.amazonaws.com/uifaces/faces/twitter/marcoramires/128.jpg"),
              ),
              title: Text(
                this.workloadTeam[index],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18),
              ),
              backgroundColor: Colors.white,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                CustomExpandedItem(
                  title: "Carrol Company: Virtuemart Plugin",
                  dueDate: "2018-03-19",
                ),
                CustomExpandedItem(
                  title: "Latinnews: Add new feature to admin page",
                  dueDate: "2019-04-17",
                ),
                CustomExpandedItem(
                  title: "Trabolgan: Email issue",
                  dueDate: "2017-05-05",
                ),
                CustomExpandedItem(
                  title:
                      "Aran Sweater Market: woocommerce & site Performance Issue",
                  dueDate: "2016-07-07",
                ),
              ],
            ),
          ),
        );
      },
      itemCount: workloadTeam.length,
    );
  }

  Future<Widget> testingFuture() {
    return new Future.delayed(
        const Duration(seconds: 3), () => customBuilder());
  }
}

class CustomExpandedItem extends StatelessWidget {
  final String title;
  final String dueDate;

  CustomExpandedItem({this.title, this.dueDate});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 5),
          child: Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
          margin: EdgeInsets.only(right: 10),
        ),
        Flexible(
          child: Container(
            //color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    //fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  softWrap: true,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 3),
                ),
                Text(
                  "Due Date: $dueDate",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

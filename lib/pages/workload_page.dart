import 'package:flutter/material.dart';

class WorkloadPage extends StatelessWidget {
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
            Text("Test2"),
            Text("test3"),
            Text("Test4")
          ],
        ),
      ),
    );
  }
}

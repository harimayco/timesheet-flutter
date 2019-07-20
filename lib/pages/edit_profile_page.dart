import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  final int userId;

  EditProfilePage(this.userId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Center(
        child: Text("Edit Profile page User ID $userId "),
      ),
    );
  }
}

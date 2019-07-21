import 'package:AvasoftTimesheet/common/functions/showDialogSingleButton.dart';
import 'package:AvasoftTimesheet/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:AvasoftTimesheet/common/api.dart';

class Response {
  final String status;
  final String message;

  Response({this.status, this.message});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(status: json['status'], message: json['message']);
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //variable member class
  final _email = TextEditingController(text: "");
  final _password = TextEditingController(text: "");

  //member response
  String _response = '';
  bool _apiCall = false;

  bool alreadyLogin = false;

  //fungsi untuk kirim http post

  Future<Response> post(String url, var body) async {
    return await http.get(
      Uri.encodeFull(url),
      headers: {"Accept": "application/json"},
    ).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      print("Test ${response.body}");
      return Response.fromJson(json.decode(response.body));
    });
  }

  void _callPostAPI() {
    post('https://my-json-server.typicode.com/harimayco/fake-api/login', {
      'email': _email.text,
      'password': _password.text
    }).then((response) async {
      setState(() {
        _apiCall = false;
        _response = response.message;
      });

      if (response.status == "success") {
        //simpan shared pref sudah login
        final prefs = await SharedPreferences.getInstance();
        setState(() {
          alreadyLogin = true;
          prefs.setBool('login', alreadyLogin);
        });

        //menuju route lust home
        Navigator.pushNamed(context, '/');
      }
    }, onError: (error) {
      _apiCall = false;
      _response = error.toString();
    });
  }

  Widget progressWidget() {
    if (_apiCall)
      return AlertDialog(
          content: new Column(
        children: <Widget>[CircularProgressIndicator(), Text("Please wait")],
      ));
    else
      return Center(
        child: Text(
          _response,
          style: TextStyle(fontSize: 15),
        ),
      );
  }

  Future<bool> getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    bool loginStatus = prefs.getBool("login") ?? false;
    print("login status $loginStatus");
    return loginStatus;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: getLoginStatus(),
      builder: (context, snapshot) {
        return (snapshot.data)
            ?
            // jika sudah login tampilkan list product
            new HomePage()
            :
            // jika belum login tampilkan form login
            loginForm();
      },
    );
  }

  Widget loginForm() {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image(
                image: AssetImage('assets/img/logo-avasoft.png'),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[400],
                      width: 2,
                    ),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                      child: Text(
                        "FILL YOUR WORKSHEET",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    TextField(
                      controller: _email,
                      decoration: InputDecoration(hintText: 'Username'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    TextField(
                      controller: _password,
                      decoration: InputDecoration(hintText: 'Password'),
                      obscureText: true,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                    ),
                    RaisedButton(
                      padding: EdgeInsets.all(15),
                      color: Theme.of(context).accentColor,
                      elevation: 0,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      onPressed: () async {
                        setState(() {
                          _apiCall = true;
                        });
                        //_callPostAPI();
                        //showDialogSingleButton(context, "Test Title",
                        //    "Anda tidak berhasil login", "OK");
                        var ret = await ApiCall(context)
                            .login(_email.text, _password.text);
                        if (ret) {
                          Navigator.pushNamed(context, '/homepage');
                        } else {
                          _apiCall = false;
                        }
                      },
                    ),
                    progressWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(244, 242, 243, 1),
    );
  }
}

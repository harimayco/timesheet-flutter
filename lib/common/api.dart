import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import './serializer/auth.dart';
import './functions/showDialogSingleButton.dart';

class ApiCall {
  final apiUrl = 'https://api.newtimesheet.linux2.stagingreview.com';
  var token = '';
  BuildContext context;

  ApiCall(this.context) {
    _setApiToken();
  }

  _setApiToken() async {
    var prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }

  Future testGet() async {
    var resp = await get('/staff-list');
    int statusCode = resp.statusCode;

    print(resp.body);
  }

  Future login(String email, var password) async {
    var resp = await post('/auth', {"username": email, "password": password});
    int statusCode = resp.statusCode;

    var result = Auth.fromJson(jsonDecode(resp.body));

    if (statusCode == 200) {
      var prefs = await SharedPreferences.getInstance();
      prefs.setString('token', result.data.accessToken);
      return true;
      //print("Success");
      //print(result.data.accessToken);
    } else {
      //print("Login gagal, silahkan cek kembali user dan password anda");
      //print(resp.body);
      showDialogSingleButton(
          context, "Test Title", "Anda tidak berhasil login", "OK");
      return false;
    }
  }

  Future post(String url, var body) async {
    var prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');

    return await http
        .post(
      Uri.encodeFull("$apiUrl$url"),
      headers: {"Accept": "application/json", "authorization": "Bearer $token"},
      body: body,
    )
        .then((http.Response response) {
      return response;
    });
  }

  Future get(String url) async {
    var prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    return await http.get(
      Uri.encodeFull("$apiUrl$url"),
      headers: {"Accept": "application/json", "authorization": "Bearer $token"},
    ).then((http.Response response) {
      return response;
    });
  }
}

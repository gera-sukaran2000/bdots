import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UserData {
  final int id;
  final String email;
  final String first_Name;
  final String last_Name;
  final String avatar_url;

  UserData({
    required this.id,
    required this.email,
    required this.first_Name,
    required this.last_Name,
    required this.avatar_url,
  });
}

class UserDataList with ChangeNotifier {
  List<UserData> getdata = [];

  List<UserData> get userData {
    return [...getdata];
  }

  Future<void> fetchApiData() async {
    final url = Uri.parse('https://reqres.in/api/users?page=2');
    final response = await http.get(url);
    List<UserData> fetchedData = [];
    final extractedData = json.decode(response.body)['data'] as List<dynamic>;
    extractedData.forEach((element) {
      fetchedData.add(UserData(
          id: element['id'],
          email: element['email'],
          first_Name: element['first_name'],
          last_Name: element['last_name'],
          avatar_url: element['avatar']));
    });
    getdata = fetchedData;
    notifyListeners();
  }
}

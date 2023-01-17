
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_1/api.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginService {
  Network network = Network();
  String token = "";


  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("http://10.0.2.2:3000/api/login"),
      headers:_setHeaders(), //_setHeaders(),
      body: json.encode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      {
        print(response.body);
        return true;
      }
    } else {
      print('Failed to connect!');
      return false;
    }
  }
  _setHeaders() => {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': "*/*",
    'connection': 'keep-alive',
    'Accept-Encoding' : 'gzip, deflate, br',
    'Authorization': 'Bearer $token'
  };

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString("token")!;
  }

}
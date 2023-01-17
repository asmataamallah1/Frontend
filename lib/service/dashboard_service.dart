import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_1/models/humidity_model.dart';
import 'package:test_1/models/luminosity_model.dart';
import 'package:test_1/models/pressure_model.dart';
import 'package:test_1/models/temperature_model.dart';

import 'package:http/http.dart' as http;

import '../api.dart';


var mesurmentsData;
class irrigationservice {
  Network network = Network();
  String token = "";
  DateTime selectedDate = DateTime.parse('2022-12-09 00:00:00');

  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("http://10.0.2.2:3000/api/login"),
      headers: _setHeaders(), //_setHeaders(),
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

   getHumidity() async {
    final response = await http.post(
        Uri.parse("http://10.0.2.2:3000/api/influxdb/get/humidity"),
        headers: _setHeaders(),
        body: json.encode({'latest': true})
    );
    if (response.statusCode == 200) {
      {
        var hi = await Humidity
            .fromJson(jsonDecode(response.body))
            .data;
        return hi;
      }
    } else {
      print("data not ");
      return {};
    }
  }
  Future<Map<String, num?>?> getLuminosity() async {
    final response = await http.post(
        Uri.parse("http://10.0.2.2:3000/api/influxdb/get/luminosity"),
        headers: _setHeaders(),
        body: json.encode({'latest': true})
    );
    if (response.statusCode == 200) {
      {
        Map<String, num?>? hi = Luminosity.fromJson(jsonDecode(response.body)).data;
        return hi;
      }
    } else {
      print("data not ");
      return {};
    }
  }

  Future<Map<String, num?>?> getPressure() async {
    final response = await http.post(
        Uri.parse("http://10.0.2.2:3000/api/influxdb/get/pressure"),
        headers: _setHeaders(),
        body: json.encode({'latest': true})
    );
    if (response.statusCode == 200) {
      {
        Map<String, num?>? hi =  Humidity.fromJson(jsonDecode(response.body)).data;
        return hi;
      }
    } else {
      print("data not ");
      return {};
    }
  }

  Future<Map<String, num?>?> getTemperature() async {
    final response = await http.post(
        Uri.parse("http://10.0.2.2:3000/api/influxdb/get/temperature"),
        headers: _setHeaders(),
        body: json.encode({'latest': true})
    );
    if (response.statusCode == 200) {
      {
        var hi = await Humidity
            .fromJson(jsonDecode(response.body))
            .data;
        return hi;
      }
    } else {
      print("data not ");
      return {};
    }
  }

  _setHeaders() =>
      {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': "*/*",
        'connection': 'keep-alive',
        'Accept-Encoding': 'gzip, deflate, br',
        'Authorization': 'Bearer $token'
      };

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString("token")!;
  }





}

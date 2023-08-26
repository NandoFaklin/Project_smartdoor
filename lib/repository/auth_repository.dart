import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prata2/model/data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  Future<LoginAuth> loginUser(String _email, String _password, String device) async {
    String baseUrl = "http://ec2-44-215-83-105.compute-1.amazonaws.com/api/login";

    try {
      var response = await http.post(baseUrl, body: {
        'email': _email,
        'password': _password,
        'device_name': device
      });

      var jsonResponse = json.decode(response.body);
      return LoginAuth.fromJson(jsonResponse);
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  Future<Logout> userLogout(String token) async {
    String baseUrl = "http://ec2-44-215-83-105.compute-1.amazonaws.com/api/logout";

    try {
      var response = await http.post(baseUrl, headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json'
      });

      var responseBody = json.decode(response.body);
      return Logout.fromJson(responseBody);
    } catch (e) {
      throw Exception('Failed to logout: $e');
    }
  }

  Future<User> getData(String token) async {
    String baseUrl = "http://ec2-44-215-83-105.compute-1.amazonaws.com/api/user";

    try {
      var response = await http.get(baseUrl, headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json'
      });
      var responseBody = json.decode(response.body);
      return User.fromJson(responseBody);
    } catch (e) {
      throw Exception('Failed to fetch user data: $e');
    }
  }



  Future hashToken() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences local = await _prefs;
    final String? token = local.getString("token_sanctum") ?? null;
    if (token != null) return token;
    return null;
  }

  Future setLocalToken(String token) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences local = await _prefs;
    local.setString("token_sanctum", token);
  }

  Future unsetLocalToken() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences local = await _prefs;
    local.setString("token_sanctum", null);
  }
}


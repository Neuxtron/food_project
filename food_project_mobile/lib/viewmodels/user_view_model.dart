import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_project/models/user_model.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:food_project/utils/app_helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserViewModel extends ChangeNotifier {
  final _endpoint = "${AppConstants.baseUrl}/user";

  UserModel? _user;
  String? _token;

  UserModel? get user => _user;
  String? get token => _token;

  set token(String? newToken) => _setToken(newToken);

  Future<String> register(UserModel user) async {
    String error = "Terjadi kesalahan, silahkan coba lagi";

    try {
      final response = await http.post(
        Uri.parse("$_endpoint/register"),
        headers: {
          "Content-Type": "application/json",
        },
        body: user.toJson(),
      );
      log("Register user:\n${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["data"];
        _user = user;
        token = data["token"];
        error = "";
        notifyListeners();
      } else {
        error = jsonDecode(response.body)["message"];
      }
    } catch (e) {
      log(e.toString());
    }

    return error;
  }

  Future<String> login(String nama, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$_endpoint/login"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "nama": nama,
          "password": password,
        }),
      );
      log("Login user:\n${response.body}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["data"];
        final jsonUser = data["user"];
        _user = UserModel.fromJson(jsonUser);
        token = data["token"];
        notifyListeners();
        return "";
      } else {
        return jsonDecode(response.body)["message"];
      }
    } catch (e) {
      log(e.toString());
    }

    return "Terjadi kesalahan, silahkan coba lagi";
  }

  Future getProfil() async {
    try {
      final response = await http.get(
        Uri.parse(_endpoint),
        headers: {
          "Authorization": "Bearer $_token",
        },
      );
      log("Get profil:\n${response.body}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["data"];
        _user = UserModel.fromJson(data);
        notifyListeners();
      } else {
        logout();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<bool> logout() async {
    try {
      final response = await http.get(
        Uri.parse("$_endpoint/logout"),
        headers: {
          "Authorization": "Bearer $_token",
        },
      );
      log("Logout user:\n${response.body}");
      token = null;
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      log(e.toString());
    }
    token = null;
    return false;
  }

  void _setToken(String? token) async {
    AppHelpers.token = token;
    _token = token;
    final prefs = await SharedPreferences.getInstance();
    if (token == null) {
      prefs.remove("TOKEN");
    } else {
      prefs.setString("TOKEN", token);
    }

    notifyListeners();
  }
}

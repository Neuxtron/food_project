import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_project/models/metode_bayar_model.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class MetodeBayarViewModel extends ChangeNotifier {
  final _endpoint = "${AppConstants.baseUrl}/metode_bayar";

  List<MetodeBayarModel> _listMetodeBayar = [];
  List<MetodeBayarModel> get listMetodeBayar => _listMetodeBayar;

  Future getMetodeBayar() async {
    try {
      final response = await http.get(Uri.parse(_endpoint));
      log("Get metode bayar:\n${response.body}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["data"] as List;
        _listMetodeBayar =
            data.map((e) => MetodeBayarModel.fromJson(e)).toList();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

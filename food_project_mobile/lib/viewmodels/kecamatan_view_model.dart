import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_project/models/kecamatan_model.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class KecamatanViewModel extends ChangeNotifier {
  final _endpoint = "${AppConstants.baseUrl}/kecamatan";

  List<KecamatanModel> _listKecamatan = [];
  int? _ongkir;

  List<KecamatanModel> get listKecamatan => _listKecamatan;
  int? get ongkir => _ongkir;

  Future getKecamatan() async {
    try {
      final response = await http.get(Uri.parse(_endpoint));
      log("Get kecamatan:\n${response.body}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["data"] as List;
        _listKecamatan = data.map((e) => KecamatanModel.fromJson(e)).toList();
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future getOngkir(int id) async {
    try {
      final response = await http.get(Uri.parse("$_endpoint/ongkir/$id"));
      log("Get ongir by id:\n${response.body}");
      if (response.statusCode == 200) {
        _ongkir = jsonDecode(response.body)["data"] as int;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

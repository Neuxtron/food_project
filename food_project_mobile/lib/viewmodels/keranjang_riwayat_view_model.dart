import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_project/models/keranjang_model.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:food_project/utils/app_helpers.dart';
import 'package:http/http.dart' as http;

class KeranjangRiwayatViewModel extends ChangeNotifier {
  final _endpoint = "${AppConstants.baseUrl}/keranjang";

  List<KeranjangModel> _listKeranjang = [];
  List<KeranjangModel> _listRiwayat = [];

  List<KeranjangModel> get listKeranjang => _listKeranjang;
  List<KeranjangModel> get listRiwayat => _listRiwayat;

  Future getKeranjangRiwayat() async {
    final token = AppHelpers.token;
    try {
      final response = await http.get(
        Uri.parse(_endpoint),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      log("Get keranjang:\n${response.body}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["data"] as List;
        final listAll = data.map((e) => KeranjangModel.fromJson(e)).toList();
        _listKeranjang =
            listAll.where((element) => !element.isRiwayat!).toList();
        _listRiwayat = listAll.where((element) => element.isRiwayat!).toList();
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future updateKeranjang({KeranjangModel? keranjang}) async {
    List mapKeranjang = _listKeranjang.map((e) => e.toMap()).toList();
    if (keranjang != null) mapKeranjang = [keranjang.toMap()];
    final token = AppHelpers.token;

    try {
      final response = await http.put(
        Uri.parse(_endpoint),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: jsonEncode(mapKeranjang),
      );
      log("Update keranjang:\n${response.body}");
      if (response.statusCode != 200) {
        final message = jsonDecode(response.body)["message"];
        log(message);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

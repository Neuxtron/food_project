import 'package:flutter/material.dart';
import 'package:food_project/models/user_model.dart';

class UserViewModel extends ChangeNotifier {
  UserModel? _user = UserModel(
    nama: "MIsteln",
    telepon: "0893830303",
    kecamatan: "Kota Lhokseumawe",
    alamat:
        "Kost Diamond(kost belakang)\nMUARA SATU, KOTA LHOKSEUMAWE, NAGGROE ACEH DARUSSALAM",
  );

  UserModel? get user => _user;
}

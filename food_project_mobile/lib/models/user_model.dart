import 'dart:convert';

class UserModel {
  final String nama;
  final String hp;
  final String alamat;
  final String? kecamatan;
  final String? password;
  final int? idKecamatan;

  UserModel({
    required this.nama,
    required this.hp,
    required this.alamat,
    this.kecamatan,
    this.password,
    this.idKecamatan,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      nama: json["nama"],
      hp: json["hp"],
      kecamatan: json["kecamatan"]["nama"],
      alamat: json["alamat"],
    );
  }

  String toJson() {
    return jsonEncode({
      "nama": nama,
      "hp": hp,
      "alamat": alamat,
      "idKecamatan": idKecamatan,
      "password": password,
    });
  }
}

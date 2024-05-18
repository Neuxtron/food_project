import 'dart:convert';

class UserModel {
  final int? id;
  final String nama;
  final String hp;
  final String alamat;
  final String? kecamatan;
  final String? password;
  final int? idKecamatan;

  UserModel({
    this.id,
    required this.nama,
    required this.hp,
    required this.alamat,
    this.kecamatan,
    this.password,
    this.idKecamatan,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      nama: json["nama"],
      hp: json["hp"],
      kecamatan: json["kecamatan"]["nama"],
      alamat: json["alamat"],
      idKecamatan: json["kecamatan"]["id"],
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

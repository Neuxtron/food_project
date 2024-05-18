import 'package:food_project/utils/app_constants.dart';

class ProdukModel {
  final int id;
  final String nama;
  final int harga;
  final List<String> gambar;
  final String deskripsi;
  final int idKategori;

  ProdukModel({
    required this.id,
    required this.nama,
    required this.harga,
    required this.gambar,
    required this.deskripsi,
    required this.idKategori,
  });

  factory ProdukModel.fromJson(Map<String, dynamic> json) {
    final gambar = (json["gambar"] as List).map((item) {
      final fileName = item["fileName"];
      return "${AppConstants.baseUrl}/images/$fileName";
    }).toList();

    return ProdukModel(
      id: json["id"],
      nama: json["nama"],
      harga: json["harga"],
      gambar: gambar,
      deskripsi: json["deskripsi"],
      idKategori: json["idKategori"],
    );
  }
}

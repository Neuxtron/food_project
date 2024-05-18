import 'package:food_project/utils/app_constants.dart';

class MetodeBayarModel {
  final int id;
  final String nama;
  final String gambar;

  MetodeBayarModel({
    required this.id,
    required this.nama,
    required this.gambar,
  });

  factory MetodeBayarModel.fromJson(Map<String, dynamic> json) {
    final gambar = json["gambar"];

    return MetodeBayarModel(
      id: json["id"],
      nama: json["nama"],
      gambar: "${AppConstants.baseUrl}/images/metode_bayar/$gambar",
    );
  }
}

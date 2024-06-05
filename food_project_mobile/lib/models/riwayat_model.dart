import 'package:food_project/models/keranjang_model.dart';
import 'package:food_project/utils/app_constants.dart';

class RiwayatModel {
  final DateTime createdAt;
  final String status;
  final String img;
  final int totalBayar;
  final int ongkir;
  final List<KeranjangModel> listKeranjang;

  RiwayatModel({
    required this.createdAt,
    required this.status,
    required this.img,
    required this.totalBayar,
    required this.ongkir,
    required this.listKeranjang,
  });

  int get subtotal {
    int subtotal = 0;
    for (var keranjang in listKeranjang) {
      subtotal += keranjang.produk.harga * keranjang.amount;
    }
    return subtotal;
  }

  factory RiwayatModel.fromJson(Map<String, dynamic> json) {
    final img = json["img"];
    final listCart = json["keranjang"] as List;

    return RiwayatModel(
      createdAt: DateTime.parse(json["createdAt"]),
      status: json["status"],
      img: "${AppConstants.baseUrl}/images/$img",
      totalBayar: json["total"],
      ongkir: json["ongkir"],
      listKeranjang: listCart.map((e) => KeranjangModel.fromJson(e)).toList(),
    );
  }
}

import 'package:food_project/models/produk_model.dart';

class KeranjangModel {
  final int? id;
  final ProdukModel produk;
  final int? harga;
  final DateTime? createdAt;
  final bool? isRiwayat;
  int amount;
  bool isChecked = false;

  KeranjangModel({
    required this.produk,
    this.createdAt,
    this.harga,
    this.id,
    this.amount = 1,
    this.isRiwayat,
  });

  factory KeranjangModel.fromJson(Map<String, dynamic> json) {
    final produk = ProdukModel.fromJson(json["produk"]);
    final amount = json["amount"];

    return KeranjangModel(
      id: json["id"],
      produk: produk,
      harga: produk.harga * (amount as int),
      createdAt: DateTime.parse(json["createdAt"]),
      amount: amount,
      isRiwayat: json["idOrder"] != null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "idProduk": produk.id,
      "amount": amount,
    };
  }
}

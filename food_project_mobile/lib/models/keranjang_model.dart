import 'package:food_project/models/produk_model.dart';

class KeranjangModel {
  final String? id;
  final ProdukModel produk;
  final int? harga;
  final DateTime? createdAt;
  int amount;
  bool isChecked = false;

  KeranjangModel({
    required this.produk,
    this.createdAt,
    this.harga,
    this.id,
    this.amount = 1,
  });
}

import 'package:food_project/models/produk_model.dart';

class KeranjangModel {
  final int id;
  final ProdukModel produk;
  int amount;
  bool isChecked = false;

  KeranjangModel({
    required this.id,
    required this.produk,
    this.amount = 1,
  });
}

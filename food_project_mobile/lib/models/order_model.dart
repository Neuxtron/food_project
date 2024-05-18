import 'package:food_project/models/metode_bayar_model.dart';

class OrderModel {
  final MetodeBayarModel metodeBayar;
  final int ongkir;

  OrderModel({
    required this.metodeBayar,
    required this.ongkir,
  });

  Map<String, dynamic> toMap() {
    return {
      "idMetodeBayar": metodeBayar.id,
      "ongkir": ongkir,
    };
  }
}

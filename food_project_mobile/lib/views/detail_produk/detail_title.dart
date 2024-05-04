import 'package:flutter/material.dart';
import 'package:food_project/models/produk_model.dart';
import 'package:food_project/utils/app_constants.dart';

class DetailTitle extends StatelessWidget {
  final String hargaString;
  final ProdukModel produk;

  const DetailTitle({
    super.key,
    required this.hargaString,
    required this.produk,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rp$hargaString",
            style: const TextStyle(
              color: AppConstants.primary,
              fontWeight: FontWeight.w600,
              fontSize: 26,
            ),
          ),
          Text(
            produk.nama,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

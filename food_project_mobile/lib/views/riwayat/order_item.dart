import 'package:flutter/material.dart';
import 'package:food_project/models/keranjang_model.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final KeranjangModel keranang;
  const OrderItem({super.key, required this.keranang});

  @override
  Widget build(BuildContext context) {
    final formatTanggal =
        DateFormat("dd MMMM yyyy").format(keranang.createdAt!);
    final formatHarga = NumberFormat('#,##,###').format(keranang.harga);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              keranang.produk.gambar[0],
              width: 120,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    keranang.produk.nama,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    formatTanggal,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.black26,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            "Rp$formatHarga",
            style: const TextStyle(
              color: AppConstants.primary,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

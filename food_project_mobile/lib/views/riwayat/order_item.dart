import 'package:flutter/material.dart';
import 'package:food_project/models/keranjang_model.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final KeranjangModel keranjang;
  const OrderItem({super.key, required this.keranjang});

  @override
  Widget build(BuildContext context) {
    final formatTanggal =
        DateFormat("dd MMMM yyyy").format(keranjang.createdAt!);
    final formatHarga = NumberFormat('###,###,###').format(keranjang.harga);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              keranjang.produk.gambar[0],
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
                    keranjang.produk.nama,
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

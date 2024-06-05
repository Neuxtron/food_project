import 'package:flutter/material.dart';
import 'package:food_project/models/riwayat_model.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final RiwayatModel riwayat;
  const OrderItem({super.key, required this.riwayat});

  @override
  Widget build(BuildContext context) {
    final formatTanggal = DateFormat("dd MMMM yyyy").format(riwayat.createdAt);
    final formatHarga = NumberFormat('###,###,###').format(riwayat.totalBayar);
    final firstProduk = riwayat.listKeranjang[0].produk;

    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        "/detail_riwayat",
        arguments: riwayat,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                firstProduk.gambar[0],
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
                      firstProduk.nama,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rp$formatHarga",
                  style: const TextStyle(
                    color: AppConstants.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
                Text(
                  riwayat.status,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

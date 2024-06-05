import 'package:flutter/material.dart';
import 'package:food_project/models/keranjang_model.dart';
import 'package:food_project/models/riwayat_model.dart';
import 'package:food_project/utils/app_constants.dart';

import 'alamat_section.dart';
import 'order_section.dart';
import 'total_section.dart';

class DetailRiwayatPage extends StatefulWidget {
  const DetailRiwayatPage({super.key});

  @override
  State<DetailRiwayatPage> createState() => _DetailRiwayatPageState();
}

class _DetailRiwayatPageState extends State<DetailRiwayatPage> {
  int getHarga(List<KeranjangModel> listKeranjang) {
    int total = 0;
    for (var keranjang in listKeranjang) {
      total += keranjang.produk.harga * keranjang.amount;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final riwayat = ModalRoute.of(context)!.settings.arguments as RiwayatModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppConstants.primary,
        title: const Text(
          "Detail Riwayat ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AlamatSection(),
            OrderSection(listKeranjang: riwayat.listKeranjang),
            TotalSection(
              harga: getHarga(riwayat.listKeranjang),
              ongkir: riwayat.ongkir,
              status: riwayat.status,
            ),
          ],
        ),
      ),
    );
  }
}

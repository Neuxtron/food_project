import 'package:flutter/material.dart';
import 'package:food_project/models/keranjang_model.dart';
import 'package:food_project/models/metode_bayar_model.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:food_project/viewmodels/metode_bayar_view_model.dart';
import 'package:food_project/views/pembayaran/alamat_section.dart';
import 'package:food_project/views/pembayaran/metode_bayar_section.dart';
import 'package:food_project/views/pembayaran/order_section.dart';
import 'package:food_project/views/pembayaran/pengiriman_section.dart';
import 'package:food_project/views/pembayaran/submit_section.dart';
import 'package:food_project/views/pembayaran/total_section.dart';
import 'package:provider/provider.dart';

class PembayaranPage extends StatefulWidget {
  const PembayaranPage({super.key});

  @override
  State<PembayaranPage> createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  int _indexMetodeBayar = 2;

  int getHarga(List<KeranjangModel> listKeranjang) {
    int total = 0;
    for (var keranjang in listKeranjang) {
      total += keranjang.produk.harga * keranjang.amount;
    }
    return total;
  }

  List<MetodeBayarModel> get _listMetodeBayar =>
      context.read<MetodeBayarViewModel>().listMetodeBayar;

  int? _ongkir;

  @override
  Widget build(BuildContext context) {
    final listKeranjang =
        ModalRoute.of(context)!.settings.arguments as List<KeranjangModel>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppConstants.primary,
        title: const Text(
          "Pembayaran",
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
            OrderSection(listKeranjang: listKeranjang),
            PengirimanSection(
              ongkir: _ongkir,
            ),
            MetodeBayarSection(
              listMetodeBayar: _listMetodeBayar,
              index: _indexMetodeBayar,
              selectMetodeBayar: (index) {
                setState(() => _indexMetodeBayar = index);
              },
            ),
            TotalSection(
              harga: getHarga(listKeranjang),
              ongkir: _ongkir,
            ),
            SubmitSection(
              harga: getHarga(listKeranjang),
              ongkir: _ongkir,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_project/models/produk_model.dart';
import 'package:food_project/views/detail_produk/detail_deskripsi.dart';
import 'package:food_project/views/widgets/cu_back_button.dart';
import 'package:intl/intl.dart';

import 'detail_actions.dart';
import 'detail_title.dart';
import 'slide_gambar_prouk.dart';

class DetailProdukPage extends StatelessWidget {
  const DetailProdukPage({super.key});

  @override
  Widget build(BuildContext context) {
    final produk = ModalRoute.of(context)!.settings.arguments as ProdukModel;

    final formatter = NumberFormat('#,##,000');
    final hargaString = formatter.format(produk.harga);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SlideGambarProduk(listGambar: produk.gambar),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailTitle(hargaString: hargaString, produk: produk),
                DetailDeskripsi(deskripsi: produk.deskripsi),
                DetailActions(produk: produk, hargaString: hargaString),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      leading: const CuBackButton(),
    );
  }
}

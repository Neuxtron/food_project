import 'package:flutter/material.dart';
import 'package:food_project/models/produk_model.dart';
import 'package:food_project/utils/app_constants.dart';
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
                const Divider(
                  color: Colors.black26,
                  thickness: 1,
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Tentang",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10),
                      Text(produk.deskripsi),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black26,
                  thickness: 1,
                  height: 100,
                ),
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
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Container(
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: const Icon(
            Icons.arrow_back,
            color: AppConstants.primary,
          ),
        ),
      ),
    );
  }
}

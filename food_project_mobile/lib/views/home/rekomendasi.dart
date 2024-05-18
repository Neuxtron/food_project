import 'package:flutter/material.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:food_project/viewmodels/produk_view_model.dart';
import 'package:food_project/views/home/rekomendasi_item.dart';
import 'package:provider/provider.dart';

class Rekomendasi extends StatelessWidget {
  final String searchText;
  const Rekomendasi({super.key, required this.searchText});

  @override
  Widget build(BuildContext context) {
    final listProduk = context.watch<ProdukViewModel>().listProduk;
    final status = context.watch<ProdukViewModel>().status;

    final searchList = listProduk.where((produk) {
      final searchLower = searchText.toLowerCase();
      final namaLower = produk.nama.toLowerCase();
      return namaLower.contains(searchLower);
    }).toList();

    if (status == ServerStatus.loading) {
      return const CircularProgressIndicator();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30, top: 40),
          child: Text(
            "Rekomendasi",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          itemCount: searchList.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 12 / 17,
            mainAxisSpacing: 10,
            crossAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            final produk = searchList[index];

            return RekomendasiItem(produk: produk);
          },
        ),
      ],
    );
  }
}

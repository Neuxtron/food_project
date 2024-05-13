import 'package:flutter/material.dart';
import 'package:food_project/viewmodels/produk_view_model.dart';
import 'package:food_project/views/home/rekomendasi_item.dart';
import 'package:provider/provider.dart';

class Rekomendasi extends StatelessWidget {
  const Rekomendasi({super.key});

  @override
  Widget build(BuildContext context) {
    final listProduk = context.read<ProdukViewModel>().listProduk;

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
          itemCount: listProduk.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 12 / 17,
            mainAxisSpacing: 10,
            crossAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            final produk = listProduk[index];

            return RekomendasiItem(produk: produk);
          },
        ),
      ],
    );
  }
}

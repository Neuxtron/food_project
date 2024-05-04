import 'package:flutter/material.dart';
import 'package:food_project/models/produk_model.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:intl/intl.dart';

class RekomendasiItem extends StatelessWidget {
  final ProdukModel produk;
  const RekomendasiItem({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,##,000');
    final hargaString = formatter.format(produk.harga);

    return MaterialButton(
      clipBehavior: Clip.hardEdge,
      onPressed: () {
        Navigator.pushNamed(context, "/detail", arguments: produk);
      },
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 5,
      color: Colors.white,
      child: Column(
        children: [
          Image.network(produk.gambar[0], width: double.infinity),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  produk.nama,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Rp$hargaString",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppConstants.primary,
                  ),
                ),
                // TODO: konfirmasi rating
                const SizedBox(height: 25),
                Row(
                  children: [
                    Text(
                      produk.rating.toString(),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const Icon(
                      Icons.star,
                      color: Color(0xFFFFC529),
                      size: 20,
                    ),
                    Text(
                      produk.formattedRatingCount,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

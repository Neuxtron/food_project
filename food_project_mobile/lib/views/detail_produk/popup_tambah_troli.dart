import 'package:flutter/material.dart';
import 'package:food_project/models/produk_model.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:food_project/views/widgets/cu_button.dart';

class PopupTambahTroli extends StatelessWidget {
  final ProdukModel produk;
  final String hargaString;
  final Function() onConfirm;

  const PopupTambahTroli({
    super.key,
    required this.produk,
    required this.hargaString,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    produk.gambar[0],
                    height: 70,
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      produk.nama,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Rp$hargaString",
                      style: const TextStyle(
                        color: AppConstants.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
            CuButton(
              onPressed: onConfirm,
              margin: const EdgeInsets.only(top: 50),
              radius: 10,
              child: const Text(
                "Tambah ke Troli",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

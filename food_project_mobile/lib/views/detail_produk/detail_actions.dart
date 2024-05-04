import 'package:flutter/material.dart';
import 'package:food_project/models/produk_model.dart';
import 'package:food_project/views/detail_produk/popup_tambah_troli.dart';
import 'package:food_project/views/widgets/cu_button.dart';

class DetailActions extends StatelessWidget {
  final ProdukModel produk;
  final String hargaString;

  const DetailActions({
    super.key,
    required this.produk,
    required this.hargaString,
  });

  void tambahTroli(BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CuButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return PopupTambahTroli(
                  produk: produk,
                  hargaString: hargaString,
                  onConfirm: () => tambahTroli(context),
                );
              },
            );
          },
          padding: EdgeInsets.zero,
          minWidth: 150,
          child: const Text(
            "Tambah ke Troli",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        CuButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          color: const Color(0xFF906B0E),
          minWidth: 150,
          child: const Text(
            "Beli",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

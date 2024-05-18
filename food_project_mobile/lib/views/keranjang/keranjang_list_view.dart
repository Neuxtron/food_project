import 'package:flutter/material.dart';
import 'package:food_project/viewmodels/keranjang_riwayat_view_model.dart';
import 'package:provider/provider.dart';

import 'keranjang_item.dart';

class KeranjangListView extends StatelessWidget {
  final Function(int index, bool isChecked, int amount) updateKeranjang;
  const KeranjangListView({super.key, required this.updateKeranjang});

  @override
  Widget build(BuildContext context) {
    final listKeranjang =
        context.watch<KeranjangRiwayatViewModel>().listKeranjang;

    return Expanded(
      child: ListView.builder(
        itemCount: listKeranjang.length,
        itemBuilder: (context, index) {
          final keranjang = listKeranjang[index];
          return KeranjangItem(
            keranjang: keranjang,
            updateKeranjang: updateKeranjang,
            index: index,
          );
        },
      ),
    );
  }
}

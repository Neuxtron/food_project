import 'package:flutter/material.dart';
import 'package:food_project/models/keranjang_model.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:food_project/views/keranjang/item_actions.dart';
import 'package:intl/intl.dart';

class KeranjangItem extends StatelessWidget {
  final KeranjangModel keranjang;
  final int index;
  final Function(int index, bool isChecked, int amount) updateKeranjang;

  const KeranjangItem({
    super.key,
    required this.keranjang,
    required this.updateKeranjang,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,##,000');
    final String hargaString = formatter.format(keranjang.produk.harga);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      margin: const EdgeInsets.only(bottom: 6),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(1, 2),
            color: Colors.black26,
          ),
        ],
      ),
      child: Row(
        children: [
          Checkbox(
            value: keranjang.isChecked,
            onChanged: (value) {
              updateKeranjang(
                index,
                !keranjang.isChecked,
                keranjang.amount,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                keranjang.produk.gambar[0],
                width: 130,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  keranjang.produk.nama,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Rp$hargaString",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppConstants.primary,
                      fontSize: 13,
                    ),
                  ),
                ),
                ItemActions(
                  onRemove: () {
                    if (keranjang.amount > 1) {
                      updateKeranjang(
                        index,
                        keranjang.isChecked,
                        --keranjang.amount,
                      );
                    }
                  },
                  onAdd: () {
                    updateKeranjang(
                      index,
                      keranjang.isChecked,
                      ++keranjang.amount,
                    );
                  },
                  amount: keranjang.amount,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

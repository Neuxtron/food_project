import 'package:flutter/material.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:food_project/views/widgets/cu_button.dart';
import 'package:intl/intl.dart';

class SubmitSection extends StatelessWidget {
  final int harga;
  final int? ongkir;
  final bool loading;
  final Function() submitOrder;

  const SubmitSection({
    super.key,
    required this.harga,
    required this.ongkir,
    required this.loading,
    required this.submitOrder,
  });

  int get _total => harga + (ongkir ?? 0);

  @override
  Widget build(BuildContext context) {
    final totalString = NumberFormat("###,###,###").format(_total);

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total Pembayaran",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                Text(
                  "Rp$totalString",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: AppConstants.primary,
                  ),
                ),
              ],
            ),
          ),
          CuButton(
            onPressed: submitOrder,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            radius: 10,
            loading: loading,
            child: const Text(
              "Beli",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

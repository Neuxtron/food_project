import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TotalSection extends StatelessWidget {
  final int harga;
  final int ongkir;

  const TotalSection({
    super.key,
    required this.harga,
    required this.ongkir,
  });

  @override
  Widget build(BuildContext context) {
    final hargaString = NumberFormat("###,###,###").format(harga);
    final ongkirString = NumberFormat("###,###,###").format(ongkir);
    final totalString = NumberFormat("###,###,###").format(ongkir + harga);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Harga",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ),
              Text(
                "Rp$hargaString",
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Ongkos Kirim",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ),
              Text(
                "Rp$ongkirString",
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Total Pembayaran",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
              Text(
                "Rp$totalString",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

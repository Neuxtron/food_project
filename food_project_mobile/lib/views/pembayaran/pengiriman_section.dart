import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PengirimanSection extends StatelessWidget {
  final int? ongkir;

  const PengirimanSection({
    super.key,
    required this.ongkir,
  });

  void ubahPengiriman() {}

  @override
  Widget build(BuildContext context) {
    String ongkirString = "";
    if (ongkir != null) {
      ongkirString = NumberFormat("###,###,###").format(ongkir);
    }

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
          const Text(
            "Opsi Pengiriman",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          const Divider(
            height: 20,
            thickness: 1,
            color: Colors.black12,
          ),
          SizedBox(
            height: 50,
            child: InkWell(
              onTap: ubahPengiriman,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Reguler (Rp$ongkirString)",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black38,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

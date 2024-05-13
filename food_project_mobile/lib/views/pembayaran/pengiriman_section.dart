import 'package:flutter/material.dart';
import 'package:food_project/models/pengiriman_model.dart';
import 'package:intl/intl.dart';

class PengirimanSection extends StatelessWidget {
  final List<PengirimanModel> listPengiriman;
  final int index;

  const PengirimanSection({
    super.key,
    required this.listPengiriman,
    required this.index,
  });

  void ubahPengiriman() {}

  @override
  Widget build(BuildContext context) {
    final pengiriman = listPengiriman[index];
    final hargaString = NumberFormat("#,##,###").format(pengiriman.harga);

    final palingCepat = DateTime.now().add(
      Duration(days: pengiriman.palingCepat),
    );
    final palingLama = DateTime.now().add(
      Duration(days: pengiriman.palingLama),
    );

    final formatter = DateFormat("d MMMM");
    final cepatString = formatter.format(palingCepat);
    final lamaString = formatter.format(palingLama);

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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${pengiriman.nama} (Rp$hargaString)",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        "Estimasi tiba $cepatString - $lamaString",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.black38,
                        ),
                      ),
                    ],
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

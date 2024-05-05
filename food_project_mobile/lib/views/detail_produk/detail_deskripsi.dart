import 'package:flutter/material.dart';

class DetailDeskripsi extends StatelessWidget {
  final String deskripsi;
  const DetailDeskripsi({super.key, required this.deskripsi});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.black26,
          thickness: 1,
          height: 70,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Tentang",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Text(deskripsi),
            ],
          ),
        ),
        const Divider(
          color: Colors.black26,
          thickness: 1,
          height: 100,
        ),
      ],
    );
  }
}

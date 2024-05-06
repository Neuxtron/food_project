import 'package:flutter/material.dart';
import 'package:food_project/models/kategori_model.dart';

class Kategori extends StatelessWidget {
  const Kategori({super.key});

  @override
  Widget build(BuildContext context) {
    final listKategory = [
      KategoriModel(
        id: 0,
        icon: "assets/images/noodles.png",
        nama: "Noodle",
      ),
      KategoriModel(
        id: 0,
        icon: "assets/images/chickens.png",
        nama: "Chicken",
      ),
      KategoriModel(
        id: 0,
        icon: "assets/images/snack.png",
        nama: "Snack",
      ),
      KategoriModel(
        id: 0,
        icon: "assets/images/gyoza.png",
        nama: "Gyoza",
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30, bottom: 10),
          child: Text(
            "Kategori",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        Row(
          children: listKategory.map((item) {
            return Expanded(
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, "/kategori"),
                child: Column(
                  children: [
                    Image.asset(item.icon, width: 70),
                    const SizedBox(height: 10),
                    Text(
                      item.nama,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

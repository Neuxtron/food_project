import 'package:flutter/material.dart';

class Kategori extends StatelessWidget {
  const Kategori({super.key});

  @override
  Widget build(BuildContext context) {
    final listKategory = [
      ["assets/images/noodles.png", "Noodle"],
      ["assets/images/chickens.png", "Chicken"],
      ["assets/images/snack.png", "Snack"],
      ["assets/images/gyoza.png", "Gyoza"],
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
                onTap: () {},
                child: Column(
                  children: [
                    Image.asset(item[0], width: 70),
                    const SizedBox(height: 10),
                    Text(
                      item[1],
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

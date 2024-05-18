import 'package:flutter/material.dart';
import 'package:food_project/models/kategori_model.dart';
import 'package:food_project/viewmodels/kategori_view_model.dart';
import 'package:provider/provider.dart';

class Kategori extends StatelessWidget {
  const Kategori({super.key});

  @override
  Widget build(BuildContext context) {
    List<KategoriModel> listKategori =
        context.watch<KategoriViewModel>().listKategori;

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
          children: listKategori.map((kategori) {
            return Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/kategori",
                      arguments: kategori);
                },
                child: Column(
                  children: [
                    Image.asset(kategori.icon, width: 70),
                    const SizedBox(height: 10),
                    Text(
                      kategori.title,
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

import 'package:flutter/material.dart';
import 'package:food_project/views/home/home_banner.dart';
import 'package:food_project/views/home/kategori.dart';
import 'package:food_project/views/home/rekomendasi.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // TODO: search
      child: Column(
        children: const [
          HomeBanner(),
          Kategori(),
          Rekomendasi(),
        ],
      ),
    );
  }
}

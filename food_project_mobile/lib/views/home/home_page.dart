import 'package:flutter/material.dart';
import 'package:food_project/viewmodels/kategori_view_model.dart';
import 'package:food_project/viewmodels/produk_view_model.dart';
import 'package:food_project/views/home/home_banner.dart';
import 'package:food_project/views/home/kategori.dart';
import 'package:food_project/views/home/rekomendasi.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  String _searchText = "";

  void getData() {
    context.read<ProdukViewModel>().getProduk();
    context.read<KategoriViewModel>().getKategori();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeBanner(
            searchController: _searchController,
            onChanged: (value) => setState(() => _searchText = value),
          ),
          const Kategori(),
          Rekomendasi(searchText: _searchText),
        ],
      ),
    );
  }
}

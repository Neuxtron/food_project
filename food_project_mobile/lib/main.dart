import 'package:flutter/material.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:food_project/views/auth_check.dart';
import 'package:food_project/views/daftar/daftar_page.dart';
import 'package:food_project/views/detail_produk/detail_produk_page.dart';
import 'package:food_project/views/kategori/kategori_page.dart';
import 'package:food_project/views/layouts/main_layout.dart';

void main() {
  runApp(const FoodProjectApp());
}

class FoodProjectApp extends StatelessWidget {
  const FoodProjectApp({super.key});

  // Color fillColor(states) {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSeed(seedColor: AppConstants.primary),
        scaffoldBackgroundColor: AppConstants.background,
        checkboxTheme: const CheckboxThemeData(
          side: BorderSide(color: AppConstants.primary),
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const AuthCheck(),
        "/daftar": (context) => const DaftarPage(),
        "/main": (context) => const MainLayout(),
        "/detail": (context) => const DetailProdukPage(),
        // TODO: kategori args
        "/kategori": (context) => const KategoriPage(),
      },
    );
  }
}

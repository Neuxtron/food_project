import 'package:flutter/material.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:food_project/viewmodels/kategori_view_model.dart';
import 'package:food_project/viewmodels/kecamatan_view_model.dart';
import 'package:food_project/viewmodels/metode_bayar_view_model.dart';
import 'package:food_project/viewmodels/produk_view_model.dart';
import 'package:food_project/viewmodels/user_view_model.dart';
import 'package:food_project/views/auth_check.dart';
import 'package:food_project/views/bayar_berhasil/bayar_berhasil_page.dart';
import 'package:food_project/views/daftar/daftar_page.dart';
import 'package:food_project/views/detail_produk/detail_produk_page.dart';
import 'package:food_project/views/kategori/kategori_page.dart';
import 'package:food_project/views/pembayaran/metode_bayar_page.dart';
import 'package:food_project/views/pembayaran/pembayaran_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const FoodProjectApp());
}

class FoodProjectApp extends StatelessWidget {
  const FoodProjectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserViewModel()),
        ChangeNotifierProvider(create: (context) => KategoriViewModel()),
        ChangeNotifierProvider(create: (context) => ProdukViewModel()),
        ChangeNotifierProvider(create: (context) => KategoriViewModel()),
        ChangeNotifierProvider(create: (context) => KecamatanViewModel()),
        ChangeNotifierProvider(create: (context) => MetodeBayarViewModel()),
      ],
      child: MaterialApp(
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
          "/detail": (context) => const DetailProdukPage(),
          "/kategori": (context) => const KategoriPage(),
          "/pembayaran": (context) => const PembayaranPage(),
          "/metode_bayar": (context) => const MetodeBayarPage(),
          "/bayar_berhasil": (context) => const BayarBerhasilPage(),
        },
      ),
    );
  }
}

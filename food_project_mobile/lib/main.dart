import 'package:flutter/material.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:food_project/views/auth_check.dart';
import 'package:food_project/views/daftar/daftar_page.dart';
import 'package:food_project/views/layouts/main_layout.dart';

void main() {
  runApp(const FoodProjectApp());
}

class FoodProjectApp extends StatelessWidget {
  const FoodProjectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSeed(seedColor: AppConstants.primary),
        scaffoldBackgroundColor: AppConstants.background,
        // TODO: checkbox theme
        // checkboxTheme: CheckboxThemeData()
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const AuthCheck(),
        "/daftar": (context) => const DaftarPage(),
        "/main": (context) => const MainLayout(),
      },
    );
  }
}

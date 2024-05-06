import 'package:flutter/material.dart';
import 'package:food_project/utils/app_icons.dart';
import 'package:food_project/views/home/home_page.dart';
import 'package:food_project/views/keranjang/keranjang_page.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final _pages = [
    const HomePage(),
    const KeranjangPage(),
    const Center(child: Text("Riwayat")),
    const Center(child: Text("Profil")),
  ];
  final _appbars = [
    AppBar(
      backgroundColor: Colors.black.withOpacity(.01),
      elevation: 0,
      surfaceTintColor: Colors.transparent,
    ),
    AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        "Keranjang saya",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      surfaceTintColor: Colors.transparent,
    ),
    AppBar(
      backgroundColor: Colors.black.withOpacity(.01),
      elevation: 0,
      surfaceTintColor: Colors.transparent,
    ),
    AppBar(
      backgroundColor: Colors.black.withOpacity(.01),
      elevation: 0,
      surfaceTintColor: Colors.transparent,
    ),
  ];

  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appbars[_currIndex],
      body: _pages[_currIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              offset: const Offset(0, -4),
              color: const Color(0xFF3F4C5F).withOpacity(.12),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currIndex,
          showSelectedLabels: false,
          backgroundColor: Colors.white,
          onTap: (index) => setState(() => _currIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: AppIcons.home,
              activeIcon: AppIcons.homeActive,
              label: "",
            ),
            BottomNavigationBarItem(
              icon: AppIcons.keranjang,
              activeIcon: AppIcons.keranjangActive,
              label: "",
            ),
            BottomNavigationBarItem(
              icon: AppIcons.riwayat,
              activeIcon: AppIcons.riwayatActive,
              label: "",
            ),
            BottomNavigationBarItem(
              icon: AppIcons.profile,
              activeIcon: AppIcons.profileActive,
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}

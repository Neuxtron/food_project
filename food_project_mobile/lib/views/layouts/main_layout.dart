import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_project/utils/app_icons.dart';
import 'package:food_project/viewmodels/keranjang_riwayat_view_model.dart';
import 'package:food_project/viewmodels/user_view_model.dart';
import 'package:food_project/views/home/home_page.dart';
import 'package:food_project/views/keranjang/keranjang_page.dart';
import 'package:food_project/views/profile/profile_page.dart';
import 'package:food_project/views/riwayat/riwayat_page.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final _pages = [
    const HomePage(),
    const KeranjangPage(),
    const RiwayatPage(),
    const ProfilePage(),
  ];
  List<AppBar> get _appbars {
    return [
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
        backgroundColor: Colors.white,
        title: const Text(
          "Riwayat",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        surfaceTintColor: Colors.transparent,
      ),
      AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: logout,
            icon: SvgPicture.asset("assets/icons/ic_logout.svg"),
          ),
        ],
        surfaceTintColor: Colors.transparent,
      ),
    ];
  }

  int _currIndex = 0;

  void logout() {
    context.read<UserViewModel>().logout();
  }

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
          onTap: (index) {
            if (_currIndex == 1) {
              context.read<KeranjangRiwayatViewModel>().updateKeranjang();
            }
            setState(() => _currIndex = index);
          },
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

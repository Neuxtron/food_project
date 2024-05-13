import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_project/viewmodels/user_view_model.dart';
import 'package:provider/provider.dart';

class AlamatSection extends StatelessWidget {
  const AlamatSection({super.key});

  void ubahAlamat() {}

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserViewModel>().user!;

    return InkWell(
      onTap: ubahAlamat,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 20),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SvgPicture.asset("assets/icons/ic_lokasi.svg"),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Alamat Pengiriman",
                    style: TextStyle(fontSize: 11),
                  ),
                  Row(
                    children: [
                      Text(
                        user.nama,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        " | ${user.telepon}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF909090),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    user.alamat,
                    style: const TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_right_rounded,
              color: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }
}
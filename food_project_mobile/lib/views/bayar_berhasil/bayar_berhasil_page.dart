import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:food_project/viewmodels/user_view_model.dart';
import 'package:food_project/views/bayar_berhasil/bayar_item.dart';
import 'package:food_project/views/widgets/cu_button.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BayarBerhasilPage extends StatelessWidget {
  const BayarBerhasilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final total = ModalRoute.of(context)!.settings.arguments as int;
    final totalString = NumberFormat("###,###,###").format(total);

    final user = context.watch<UserViewModel>().user;
    log(user?.id.toString() ?? "NO USER");
    final transfer = total + (user?.id ?? 0);
    final transferString = NumberFormat("###,###,###").format(transfer);

    final formatter = DateFormat("dd-MM-yyyy hh.mm");
    final waktuSelesai = DateTime.now();
    final waktuString = formatter.format(waktuSelesai);
    final expire = DateTime.now().add(const Duration(days: 1));
    final expireString = formatter.format(expire);

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg_profile.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 100, 30, 0),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFFF1EBEB),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        color: Colors.black26,
                      ),
                    ],
                  ),
                  child: Transform.translate(
                    offset: const Offset(0, -37),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: Color(0xFF0FA958),
                          size: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "- Rp$totalString",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Color(0xFF0FA958),
                            ),
                            Text("Berhasil"),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Text("Waktu Selesai: $waktuString"),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFFF1EBEB),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        color: Colors.black26,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.history_rounded,
                        color: Colors.grey,
                        size: 40,
                      ),
                      const Text("Pesanan pending"),
                      BayarItem(
                        label: "Silahkan bayar sebelum:",
                        value: expireString,
                        bold: false,
                      ),
                      const BayarItem(
                        label: "Ke rekening:",
                        value: AppConstants.rekening,
                      ),
                      BayarItem(
                        label: "Dengan jumlah:",
                        value: "Rp$transferString",
                        highlight: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CuButton(
                  onPressed: () => Navigator.pop(context),
                  radius: 10,
                  minWidth: double.infinity,
                  margin: const EdgeInsets.all(25),
                  child: const Text(
                    "SELESAI",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

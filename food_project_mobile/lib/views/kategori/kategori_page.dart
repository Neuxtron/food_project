import 'package:flutter/material.dart';
import 'package:food_project/models/kategori_model.dart';
import 'package:food_project/models/produk_model.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:food_project/viewmodels/produk_view_model.dart';
import 'package:food_project/views/widgets/cu_back_button.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class KategoriPage extends StatelessWidget {
  const KategoriPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('###,###,###');
    final kategori =
        ModalRoute.of(context)!.settings.arguments as KategoriModel;

    List<ProdukModel> listProdukKategori =
        context.read<ProdukViewModel>().byCategory(kategori.id);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/kategori.png",
              width: double.infinity,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              itemCount: listProdukKategori.length,
              itemBuilder: (context, index) {
                final produk = listProdukKategori[index];
                final hargaString = formatter.format(produk.harga);

                return Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        color: Colors.black26,
                      ),
                    ],
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/detail",
                        arguments: produk,
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          produk.gambar[0],
                          width: double.infinity,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                produk.nama,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "Rp$hargaString",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppConstants.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      leading: const CuBackButton(),
    );
  }
}

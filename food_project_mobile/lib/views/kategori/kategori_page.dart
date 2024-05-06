import 'package:flutter/material.dart';
import 'package:food_project/models/produk_model.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:food_project/views/widgets/cu_back_button.dart';
import 'package:food_project/views/widgets/cu_rating.dart';
import 'package:intl/intl.dart';

class KategoriPage extends StatelessWidget {
  const KategoriPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,##,000');
    List<ProdukModel> listProdukKategori = [
      ProdukModel(
        id: 0,
        nama: "Korean Spicy Chicken",
        harga: 15000,
        gambar: [
          "https://i.ytimg.com/vi/XnLWBoZn710/maxresdefault.jpg",
          "https://i.ytimg.com/vi/XnLWBoZn710/maxresdefault.jpg",
          "https://i.ytimg.com/vi/XnLWBoZn710/maxresdefault.jpg",
        ],
        rating: 4.5,
        ratingCount: 100,
        deskripsi:
            "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Mollitia tempora alias quod beatae eligendi, nemo quam deserunt ad ex modi natus sed quidem corporis perspiciatis. Molestiae, ratione blanditiis! Consequatur libero exercitationem est laudantium reprehenderit modi inventore impedit, quibusdam quas eligendi illum, a soluta dolorem quis, quaerat sit dolorum voluptates mollitia nihil corrupti rerum numquam ipsa saepe deserunt! Quisquam amet fuga necessitatibus natus, laborum repellendus omnis sapiente adipisci asperiores dicta labore voluptates? Recusandae nemo neque sapiente quia tenetur reprehenderit, dicta suscipit veniam temporibus atque magnam dolorem nam iste accusantium eius beatae velit porro ex explicabo ipsa quasi similique? Deleniti, laboriosam quibusdam?",
      ),
      ProdukModel(
        id: 0,
        nama: "Korean Spicy Chicken",
        harga: 15000,
        gambar: ["https://i.ytimg.com/vi/XnLWBoZn710/maxresdefault.jpg"],
        rating: 4.5,
        ratingCount: 100,
        deskripsi:
            "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Mollitia tempora alias quod beatae eligendi, nemo quam deserunt ad ex modi natus sed quidem corporis perspiciatis. Molestiae, ratione blanditiis! Consequatur libero exercitationem est laudantium reprehenderit modi inventore impedit, quibusdam quas eligendi illum, a soluta dolorem quis, quaerat sit dolorum voluptates mollitia nihil corrupti rerum numquam ipsa saepe deserunt! Quisquam amet fuga necessitatibus natus, laborum repellendus omnis sapiente adipisci asperiores dicta labore voluptates? Recusandae nemo neque sapiente quia tenetur reprehenderit, dicta suscipit veniam temporibus atque magnam dolorem nam iste accusantium eius beatae velit porro ex explicabo ipsa quasi similique? Deleniti, laboriosam quibusdam?",
      ),
    ];

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
                  child: Column(
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
                            CuRating(
                              produk: produk,
                              mainAxisAlignment: MainAxisAlignment.end,
                            ),
                          ],
                        ),
                      ),
                    ],
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
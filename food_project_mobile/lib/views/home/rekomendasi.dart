import 'package:flutter/material.dart';
import 'package:food_project/models/produk_model.dart';
import 'package:food_project/views/home/rekomendasi_item.dart';

class Rekomendasi extends StatelessWidget {
  const Rekomendasi({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyProduk = [
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30, top: 40),
          child: Text(
            "Rekomendasi",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          itemCount: dummyProduk.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 12 / 17,
            mainAxisSpacing: 10,
            crossAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            final produk = dummyProduk[index];

            return RekomendasiItem(produk: produk);
          },
        ),
      ],
    );
  }
}

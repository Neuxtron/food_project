import 'package:flutter/material.dart';
import 'package:food_project/models/keranjang_model.dart';
import 'package:food_project/models/produk_model.dart';
import 'package:food_project/views/riwayat/order_item.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final listOrder = [
      KeranjangModel(
        createdAt: DateTime(2024, 3, 28),
        harga: 15000,
        produk: ProdukModel(
          id: 0,
          nama: "Korean Spicy Chicken",
          harga: 15000,
          gambar: ["https://i.ytimg.com/vi/XnLWBoZn710/maxresdefault.jpg"],
          deskripsi:
              "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Mollitia tempora alias quod beatae eligendi, nemo quam deserunt ad ex modi natus sed quidem corporis perspiciatis. Molestiae, ratione blanditiis! Consequatur libero exercitationem est laudantium reprehenderit modi inventore impedit, quibusdam quas eligendi illum, a soluta dolorem quis, quaerat sit dolorum voluptates mollitia nihil corrupti rerum numquam ipsa saepe deserunt! Quisquam amet fuga necessitatibus natus, laborum repellendus omnis sapiente adipisci asperiores dicta labore voluptates? Recusandae nemo neque sapiente quia tenetur reprehenderit, dicta suscipit veniam temporibus atque magnam dolorem nam iste accusantium eius beatae velit porro ex explicabo ipsa quasi similique? Deleniti, laboriosam quibusdam?",
          idKategori: 1,
        ),
      ),
      KeranjangModel(
        createdAt: DateTime(2024, 3, 20),
        harga: 45000,
        produk: ProdukModel(
          id: 0,
          nama: "Korean Spicy Chicken",
          harga: 15000,
          gambar: ["https://i.ytimg.com/vi/XnLWBoZn710/maxresdefault.jpg"],
          deskripsi:
              "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Mollitia tempora alias quod beatae eligendi, nemo quam deserunt ad ex modi natus sed quidem corporis perspiciatis. Molestiae, ratione blanditiis! Consequatur libero exercitationem est laudantium reprehenderit modi inventore impedit, quibusdam quas eligendi illum, a soluta dolorem quis, quaerat sit dolorum voluptates mollitia nihil corrupti rerum numquam ipsa saepe deserunt! Quisquam amet fuga necessitatibus natus, laborum repellendus omnis sapiente adipisci asperiores dicta labore voluptates? Recusandae nemo neque sapiente quia tenetur reprehenderit, dicta suscipit veniam temporibus atque magnam dolorem nam iste accusantium eius beatae velit porro ex explicabo ipsa quasi similique? Deleniti, laboriosam quibusdam?",
          idKategori: 1,
        ),
      ),
      KeranjangModel(
        createdAt: DateTime(2024, 3, 28),
        harga: 30000,
        produk: ProdukModel(
          id: 0,
          nama: "Korean Spicy Chicken",
          harga: 15000,
          gambar: ["https://i.ytimg.com/vi/XnLWBoZn710/maxresdefault.jpg"],
          deskripsi:
              "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Mollitia tempora alias quod beatae eligendi, nemo quam deserunt ad ex modi natus sed quidem corporis perspiciatis. Molestiae, ratione blanditiis! Consequatur libero exercitationem est laudantium reprehenderit modi inventore impedit, quibusdam quas eligendi illum, a soluta dolorem quis, quaerat sit dolorum voluptates mollitia nihil corrupti rerum numquam ipsa saepe deserunt! Quisquam amet fuga necessitatibus natus, laborum repellendus omnis sapiente adipisci asperiores dicta labore voluptates? Recusandae nemo neque sapiente quia tenetur reprehenderit, dicta suscipit veniam temporibus atque magnam dolorem nam iste accusantium eius beatae velit porro ex explicabo ipsa quasi similique? Deleniti, laboriosam quibusdam?",
          idKategori: 1,
        ),
      ),
    ];

    return ListView.builder(
      itemCount: listOrder.length,
      itemBuilder: (context, index) {
        final order = listOrder[index];
        return OrderItem(keranang: order);
      },
    );
  }
}

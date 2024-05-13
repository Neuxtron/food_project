import 'package:flutter/material.dart';
import 'package:food_project/models/produk_model.dart';

class ProdukViewModel extends ChangeNotifier {
  List<ProdukModel> _listProduk = [
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
      idKategori: 1,
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
      idKategori: 2,
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
      idKategori: 3,
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
      idKategori: 4,
    ),
  ];

  List<ProdukModel> get listProduk => _listProduk;

  List<ProdukModel> byCategory(int idKategori) {
    return _listProduk
        .where((produk) => produk.idKategori == idKategori)
        .toList();
  }
}

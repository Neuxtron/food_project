import 'package:flutter/material.dart';
import 'package:food_project/models/order_model.dart';
import 'package:food_project/views/riwayat/order_item.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final listOrder = [
      OrderModel(
        nama: "Korean Spicy chicken",
        createdAt: DateTime(2024, 3, 28),
        harga: 15000,
        gambar: "https://i.ytimg.com/vi/XnLWBoZn710/maxresdefault.jpg",
      ),
      OrderModel(
        nama: "Korean Spicy chicken",
        createdAt: DateTime(2024, 3, 20),
        harga: 45000,
        gambar: "https://i.ytimg.com/vi/XnLWBoZn710/maxresdefault.jpg",
      ),
      OrderModel(
        nama: "Korean Spicy chicken",
        createdAt: DateTime(2024, 3, 28),
        harga: 30000,
        gambar: "https://i.ytimg.com/vi/XnLWBoZn710/maxresdefault.jpg",
      ),
    ];

    return ListView.builder(
      itemCount: listOrder.length,
      itemBuilder: (context, index) {
        final order = listOrder[index];
        return OrderItem(order: order);
      },
    );
  }
}

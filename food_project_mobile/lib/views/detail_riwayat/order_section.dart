import 'package:flutter/material.dart';
import 'package:food_project/models/keranjang_model.dart';

import 'order_item.dart';

class OrderSection extends StatelessWidget {
  final List<KeranjangModel> listKeranjang;
  const OrderSection({super.key, required this.listKeranjang});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemCount: listKeranjang.length,
      itemBuilder: (context, index) {
        final order = listKeranjang[index];
        return OrderItem(keranjang: order);
      },
    );
  }
}

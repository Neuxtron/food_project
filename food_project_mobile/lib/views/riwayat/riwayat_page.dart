import 'package:flutter/material.dart';
import 'package:food_project/viewmodels/keranjang_riwayat_view_model.dart';
import 'package:food_project/views/riwayat/order_item.dart';
import 'package:provider/provider.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  @override
  void initState() {
    super.initState();
    context.read<KeranjangRiwayatViewModel>().getKeranjangRiwayat();
  }

  @override
  Widget build(BuildContext context) {
    final listOrder = context.watch<KeranjangRiwayatViewModel>().listRiwayat;

    return ListView.builder(
      itemCount: listOrder.length,
      itemBuilder: (context, index) {
        final order = listOrder[index];
        return OrderItem(keranjang: order);
      },
    );
  }
}

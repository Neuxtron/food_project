import 'package:flutter/material.dart';
import 'package:food_project/viewmodels/order_view_model.dart';
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
    context.read<OrderViewModel>().getRiwayat();
  }

  @override
  Widget build(BuildContext context) {
    final listOrder = context.watch<OrderViewModel>().listRiwayat;

    return ListView.builder(
      itemCount: listOrder.length,
      itemBuilder: (context, index) {
        final riwayat = listOrder[index];
        return OrderItem(riwayat: riwayat);
      },
    );
  }
}

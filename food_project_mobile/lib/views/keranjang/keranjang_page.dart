import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_project/models/keranjang_model.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:food_project/viewmodels/keranjang_riwayat_view_model.dart';
import 'package:food_project/views/keranjang/keranjang_item.dart';
import 'package:food_project/views/widgets/cu_button.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({super.key});

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  final _formatter = NumberFormat('###,###,###');
  String get _hargaString => _formatter.format(_total);

  List<KeranjangModel> get _listOrder {
    final List<KeranjangModel> listOrder = [];

    for (var keranjang in _listKeranjang) {
      if (keranjang.isChecked) listOrder.add(keranjang);
    }

    return listOrder;
  }

  List<KeranjangModel> get _listKeranjang =>
      context.watch<KeranjangRiwayatViewModel>().listKeranjang;

  int get _total {
    int total = 0;
    for (var keranjang in _listKeranjang) {
      if (keranjang.isChecked) {
        total += keranjang.produk.harga * keranjang.amount;
      }
    }
    return total;
  }

  void updateKeranjang(int index, bool isChecked, int amount) {
    final listKeranjang =
        context.read<KeranjangRiwayatViewModel>().listKeranjang;
    listKeranjang[index].isChecked = isChecked;
    listKeranjang[index].amount = amount;
    setState(() {});
  }

  void submitBeli() {
    if (_listOrder.isNotEmpty) {
      Navigator.pushNamed(context, "/pembayaran", arguments: _listOrder);
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<KeranjangRiwayatViewModel>().getKeranjangRiwayat();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _listKeranjang.length,
            itemBuilder: (context, index) {
              final keranjang = _listKeranjang[index];
              return KeranjangItem(
                keranjang: keranjang,
                updateKeranjang: updateKeranjang,
                index: index,
              );
            },
          ),
        ),
        const Divider(color: Colors.black12),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/icons/ic_keranjang_active.svg"),
              const SizedBox(width: 10),
              Text(
                "Rp$_hargaString",
                style: const TextStyle(
                  color: AppConstants.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Expanded(child: SizedBox()),
              CuButton(
                onPressed: submitBeli,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                radius: 10,
                child: const Text(
                  "Beli",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

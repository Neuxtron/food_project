import 'package:flutter/material.dart';
import 'package:food_project/models/keranjang_model.dart';
import 'package:food_project/models/metode_bayar_model.dart';
import 'package:food_project/models/pengiriman_model.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:food_project/views/pembayaran/alamat_section.dart';
import 'package:food_project/views/pembayaran/metode_bayar_section.dart';
import 'package:food_project/views/pembayaran/order_section.dart';
import 'package:food_project/views/pembayaran/pengiriman_section.dart';
import 'package:food_project/views/pembayaran/submit_section.dart';
import 'package:food_project/views/pembayaran/total_section.dart';

class PembayaranPage extends StatefulWidget {
  const PembayaranPage({super.key});

  @override
  State<PembayaranPage> createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  final _listPengirimman = [
    PengirimanModel(
      id: 1,
      nama: "J&T",
      harga: 10000,
      palingCepat: 3,
      palingLama: 5,
    ),
    PengirimanModel(
      id: 2,
      nama: "Coda",
      harga: 10000,
      palingCepat: 3,
      palingLama: 5,
    ),
    PengirimanModel(
      id: 3,
      nama: "Maxim",
      harga: 10000,
      palingCepat: 3,
      palingLama: 7,
    ),
  ];

  final _listMetodeBayar = [
    MetodeBayarModel(
      id: 0,
      nama: "Kode Bayar",
      gambar:
          "https://previews.123rf.com/images/nikiteev/nikiteev1905/nikiteev190500045/123324914-vektor-schwarzer-umriss-symbol-passwort-pin-code-symbol.jpg",
    ),
    MetodeBayarModel(
      id: 2,
      nama: "Take Away",
      gambar:
          "https://i.pinimg.com/564x/4e/76/79/4e76799d553e2cf2c171812b501bbfc7.jpg",
    ),
    MetodeBayarModel(
      id: 3,
      nama: "COD",
      gambar:
          "https://static.vecteezy.com/system/resources/previews/030/740/487/non_2x/cash-on-delivery-logo-free-png.png",
    ),
  ];

  int _indexPengiriman = 0;
  int _indexMetodeBayar = 2;

  int getHarga(List<KeranjangModel> listKeranjang) {
    int total = 0;
    for (var keranjang in listKeranjang) {
      total += keranjang.produk.harga * keranjang.amount;
    }
    return total;
  }

  int get _ongkir => _listPengirimman[_indexPengiriman].harga;

  @override
  Widget build(BuildContext context) {
    final listKeranjang =
        ModalRoute.of(context)!.settings.arguments as List<KeranjangModel>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppConstants.primary,
        title: const Text(
          "Pembayaran",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AlamatSection(),
            OrderSection(listKeranjang: listKeranjang),
            PengirimanSection(
              listPengiriman: _listPengirimman,
              index: _indexPengiriman,
            ),
            MetodeBayarSection(
              listMetodeBayar: _listMetodeBayar,
              index: _indexMetodeBayar,
              selectMetodeBayar: (index) {
                setState(() => _indexMetodeBayar = index);
              },
            ),
            TotalSection(
              harga: getHarga(listKeranjang),
              ongkir: _ongkir,
            ),
            SubmitSection(
              harga: getHarga(listKeranjang),
              ongkir: _ongkir,
            ),
          ],
        ),
      ),
    );
  }
}

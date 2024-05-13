import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_project/models/keranjang_model.dart';
import 'package:food_project/models/produk_model.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:food_project/views/keranjang/keranjang_item.dart';
import 'package:food_project/views/widgets/cu_button.dart';
import 'package:intl/intl.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({super.key});

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  final _formatter = NumberFormat('#,##,###');
  String get _hargaString => _formatter.format(_total);

  List<KeranjangModel> get _listOrder {
    final List<KeranjangModel> listOrder = [];

    for (var trolley in _dummyKeranjang) {
      if (trolley.isChecked) listOrder.add(trolley);
    }

    return listOrder;
  }

  final _dummyKeranjang = [
    KeranjangModel(
      produk: ProdukModel(
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
    ),
    KeranjangModel(
      produk: ProdukModel(
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
    ),
    KeranjangModel(
      produk: ProdukModel(
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
    ),
  ];

  int get _total {
    int total = 0;
    for (var keranjang in _dummyKeranjang) {
      if (keranjang.isChecked) {
        total += keranjang.produk.harga * keranjang.amount;
      }
    }
    return total;
  }

  void updateKeranjang(int index, bool isChecked, int amount) {
    _dummyKeranjang[index].isChecked = isChecked;
    _dummyKeranjang[index].amount = amount;
    setState(() {});
  }

  void submitBeli() {
    if (_listOrder.isNotEmpty) {
      Navigator.pushNamed(context, "/pembayaran", arguments: _listOrder);
    }
  }

  @override
  void dispose() {
    super.dispose();
    // TODO: update keranjang api
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _dummyKeranjang.length,
            itemBuilder: (context, index) {
              final keranjang = _dummyKeranjang[index];
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

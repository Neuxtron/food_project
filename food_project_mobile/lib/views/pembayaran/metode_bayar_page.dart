import 'package:flutter/material.dart';
import 'package:food_project/models/metode_bayar_model.dart';
import 'package:food_project/utils/app_constants.dart';

class MetodeBayarPage extends StatelessWidget {
  const MetodeBayarPage({super.key});

  void ubahMetode(BuildContext context, int index) {
    Navigator.pop(context, index);
  }

  @override
  Widget build(BuildContext context) {
    final listMetodeBayar =
        ModalRoute.of(context)!.settings.arguments as List<MetodeBayarModel>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppConstants.primary,
        title: const Text(
          "Metode Pembayaran",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        surfaceTintColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: listMetodeBayar.length,
        itemBuilder: (context, index) {
          final metodeBayar = listMetodeBayar[index];

          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black12,
                width: 1,
              ),
            ),
            child: InkWell(
              onTap: () => ubahMetode(context, index),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Image.network(
                      metodeBayar.gambar,
                      height: 50,
                      width: 60,
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox();
                      },
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        metodeBayar.nama,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

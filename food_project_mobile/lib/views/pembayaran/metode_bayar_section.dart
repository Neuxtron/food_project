import 'package:flutter/material.dart';
import 'package:food_project/models/metode_bayar_model.dart';

class MetodeBayarSection extends StatelessWidget {
  final List<MetodeBayarModel> listMetodeBayar;
  final int index;
  final Function(int index) selectMetodeBayar;

  const MetodeBayarSection({
    super.key,
    required this.listMetodeBayar,
    required this.index,
    required this.selectMetodeBayar,
  });

  void ubahMetode(BuildContext context) {
    Navigator.pushNamed(context, "/metode_bayar", arguments: listMetodeBayar)
        .then((index) {
      if (index != null) selectMetodeBayar(index as int);
    });
  }

  @override
  Widget build(BuildContext context) {
    MetodeBayarModel? metodeBayar;
    if (listMetodeBayar.isNotEmpty) metodeBayar = listMetodeBayar[index];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Metode Pembayaran",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          const Divider(
            height: 20,
            thickness: 1,
            color: Colors.black12,
          ),
          SizedBox(
            height: 50,
            child: InkWell(
              onTap: () => ubahMetode(context),
              child: Row(
                children: [
                  metodeBayar != null
                      ? Image.network(
                          metodeBayar.gambar,
                          height: double.infinity,
                          width: 60,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox();
                          },
                        )
                      : const SizedBox(),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      metodeBayar?.nama ?? "",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black38,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

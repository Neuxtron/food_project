import 'package:flutter/material.dart';
import 'package:food_project/models/kecamatan_model.dart';
import 'package:food_project/viewmodels/kecamatan_view_model.dart';
import 'package:provider/provider.dart';

class KecamatanDropdown extends StatelessWidget {
  final Function(int? value) onChange;
  final int? value;

  const KecamatanDropdown({
    super.key,
    required this.onChange,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    List<KecamatanModel> listKecamatan =
        context.watch<KecamatanViewModel>().listKecamatan;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            "Kecamatan",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: value,
              isExpanded: true,
              borderRadius: BorderRadius.circular(8),
              onChanged: onChange,
              items: listKecamatan.map((kecamatan) {
                return DropdownMenuItem(
                  value: kecamatan.id,
                  child: Text(kecamatan.nama),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

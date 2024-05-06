import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:food_project/views/widgets/cu_button.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({super.key});

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  int _total = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ListView.builder(itemBuilder: itemBuilder),
        const Expanded(child: SizedBox()),
        const Divider(color: Colors.black12),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/icons/ic_keranjang_active.svg"),
              const SizedBox(width: 10),
              Text(
                "Rp$_total",
                style: const TextStyle(
                  color: AppConstants.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Expanded(child: SizedBox()),
              CuButton(
                onPressed: () {},
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

import 'package:flutter/material.dart';
import 'package:food_project/models/produk_model.dart';

class CuRating extends StatelessWidget {
  final ProdukModel produk;
  final MainAxisAlignment mainAxisAlignment;

  const CuRating({
    super.key,
    required this.produk,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          produk.rating.toString(),
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const Icon(
          Icons.star,
          color: Color(0xFFFFC529),
          size: 20,
        ),
        Text(
          produk.formattedRatingCount,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 11,
          ),
        )
      ],
    );
  }
}

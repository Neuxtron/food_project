import 'package:flutter/material.dart';
import 'package:food_project/utils/app_constants.dart';

class CuBackButton extends StatelessWidget {
  const CuBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Container(
        padding: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: const Icon(
          Icons.arrow_back,
          color: AppConstants.primary,
        ),
      ),
    );
  }
}

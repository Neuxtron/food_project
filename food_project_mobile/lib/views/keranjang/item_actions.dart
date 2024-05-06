import 'package:flutter/material.dart';
import 'package:food_project/utils/app_constants.dart';
import 'package:food_project/views/widgets/cu_outlline_button.dart';

class ItemActions extends StatelessWidget {
  final Function() onRemove;
  final Function() onAdd;
  final int amount;

  const ItemActions({
    super.key,
    required this.onRemove,
    required this.onAdd,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CuOutlineButton(
          onPressed: onRemove,
          child: const Text(
            "-",
            style: TextStyle(color: AppConstants.primary),
          ),
        ),
        Expanded(
          child: Container(
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10,
                  offset: Offset(0, 5),
                  color: Colors.black12,
                )
              ],
            ),
            child: Center(
              child: Text(
                amount.toString(),
                style: const TextStyle(color: Colors.black45),
              ),
            ),
          ),
        ),
        CuOutlineButton(
          onPressed: onAdd,
          child: const Text(
            "+",
            style: TextStyle(color: AppConstants.primary),
          ),
        ),
      ],
    );
  }
}

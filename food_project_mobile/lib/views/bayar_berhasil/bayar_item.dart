import 'package:flutter/material.dart';

class BayarItem extends StatelessWidget {
  final String label;
  final String value;
  final bool bold;
  final bool highlight;

  const BayarItem({
    super.key,
    required this.label,
    required this.value,
    this.bold = true,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5, top: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Stack(
            children: [
              highlight
                  ? const Positioned(
                      right: 0,
                      child: ColoredBox(
                        color: Color(0xFFffc107),
                        child: Text(
                          ",000",
                          style: TextStyle(
                              fontSize: 16, color: Colors.transparent),
                        ),
                      ),
                    )
                  : const SizedBox(),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

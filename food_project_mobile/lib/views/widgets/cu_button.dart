import 'package:flutter/material.dart';
import 'package:food_project/utils/app_constants.dart';

class CuButton extends StatelessWidget {
  final Widget child;
  final Function() onPressed;
  final Color color;
  final double radius;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  const CuButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.color = AppConstants.primary,
    this.radius = 999,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 70,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: MaterialButton(
        onPressed: onPressed,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        padding: padding,
        child: child,
      ),
    );
  }
}

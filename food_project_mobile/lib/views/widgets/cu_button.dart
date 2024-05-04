import 'package:flutter/material.dart';
import 'package:food_project/utils/app_constants.dart';

class CuButton extends StatelessWidget {
  final Widget child;
  final Function() onPressed;
  final Color color;
  final double radius;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double? minWidth;

  const CuButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.minWidth,
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
        minWidth: minWidth,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        padding: padding,
        child: child,
      ),
    );
  }
}

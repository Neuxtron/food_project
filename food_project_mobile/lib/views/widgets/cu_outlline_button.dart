import 'package:flutter/material.dart';
import 'package:food_project/utils/app_constants.dart';

class CuOutlineButton extends StatelessWidget {
  final Widget child;
  final Function() onPressed;
  final Color color;
  final double radius;
  final EdgeInsetsGeometry margin;
  final double? minWidth;
  final double size;

  const CuOutlineButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.minWidth = 0,
    this.color = AppConstants.primary,
    this.radius = 12,
    this.margin = EdgeInsets.zero,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: SizedBox(
        width: size,
        height: size,
        child: MaterialButton(
          onPressed: onPressed,
          color: Colors.white,
          minWidth: minWidth,
          splashColor: color.withOpacity(.7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(color: color),
          ),
          child: child,
        ),
      ),
    );
  }
}

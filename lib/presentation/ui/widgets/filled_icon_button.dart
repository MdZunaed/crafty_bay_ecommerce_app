import 'package:flutter/material.dart';

import '../utility/app_colors.dart';

class FilledIconButton extends StatelessWidget {
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final ShapeBorder? shape;
  final Color? color;
  final Color? surfaceColor;
  final Color? shadowColor;
  final double? elevation;
  final IconData icon;
  final VoidCallback onTap;
  final double? iconSize;
  final Color? iconColor;
  const FilledIconButton(
      {super.key,
      this.height,
      this.width,
      this.borderRadius,
      this.padding,
      this.shape,
      this.color,
      required this.icon,
      this.iconSize,
      this.iconColor,
      required this.onTap,
      this.elevation,
      this.surfaceColor,
      this.shadowColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(3),
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(5),
        child: SizedBox(
            height: height ?? 30,
            width: width ?? 30,
            child: Card(
              color: color ?? AppColors.primaryColor,
              surfaceTintColor: surfaceColor ?? Colors.white,
              elevation: 1.5,
              shadowColor: shadowColor,
              shape: shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              child: Icon(
                icon,
                size: iconSize ?? 18,
                color: iconColor ?? Colors.white,
              ),
            )),
      ),
    );
  }
}

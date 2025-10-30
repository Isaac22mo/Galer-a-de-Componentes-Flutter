import 'package:flutter/material.dart';

enum CustomCardVariant { elevated, outlined, filled }

class CustomCard extends StatelessWidget {
  final Widget child;
  final CustomCardVariant variant;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final Color? color;
  final double elevation;

  const CustomCard({
    super.key,
    required this.child,
    this.variant = CustomCardVariant.elevated,
    this.width,
    this.height,
    this.padding = const EdgeInsets.all(16.0),
    this.borderRadius = 12.0,
    this.color,
    this.elevation = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    Color cardColor = color ?? Theme.of(context).cardColor;
    ShapeBorder shape;
    double currentElevation;

    switch (variant) {
      case CustomCardVariant.elevated:
        currentElevation = elevation;
        shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        );
        break;
      case CustomCardVariant.outlined:
        currentElevation = 0.0;
        shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: const BorderSide(color: Colors.grey, width: 1.0),
        );
        cardColor = Colors.transparent;
        break;
      case CustomCardVariant.filled:
        currentElevation = 0.0;
        shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        );
        cardColor = cardColor.withOpacity(0.1); 
        break;
    }

    return Card(
      color: cardColor,
      elevation: currentElevation,
      shape: shape,
      child: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: padding!,
          child: child,
        ),
      ),
    );
  }
}
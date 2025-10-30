import 'package:flutter/material.dart';

enum CustomButtonVariant { primary, secondary, outlined }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final CustomButtonVariant variant;
  final double? width;
  final double height;
  final double borderRadius;
  final double elevation;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = CustomButtonVariant.primary,
    this.width,
    this.height = 48.0,
    this.borderRadius = 8.0,
    this.elevation = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor;
    Color? foregroundColor;
    BorderSide? borderSide;

    switch (variant) {
      case CustomButtonVariant.primary:
        backgroundColor = Colors.blue.shade700;
        foregroundColor = Colors.white;
        borderSide = BorderSide.none;
        break;
      case CustomButtonVariant.secondary:
        backgroundColor = Colors.grey.shade300;
        foregroundColor = Colors.black87;
        borderSide = BorderSide.none;
        break;
      case CustomButtonVariant.outlined:
        backgroundColor = Colors.transparent;
        foregroundColor = Colors.blue.shade700;
        borderSide = BorderSide(color: Colors.blue.shade700, width: 2.0);
        break;
    }

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: variant == CustomButtonVariant.primary ? elevation : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: borderSide,
          ),
          padding: EdgeInsets.zero,
        ),
        child: Text(text),
      ),
    );
  }
}
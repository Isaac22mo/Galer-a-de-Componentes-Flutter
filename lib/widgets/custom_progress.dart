import 'package:flutter/material.dart';

enum CustomProgressVariant { linear, circular, custom }

class CustomProgress extends StatelessWidget {
  final double? value; 
  final CustomProgressVariant variant;
  final Color? color;
  final Color? backgroundColor;
  final double size; 

  const CustomProgress({
    super.key,
    this.value,
    this.variant = CustomProgressVariant.linear,
    this.color,
    this.backgroundColor,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    final Color progressColor = color ?? Theme.of(context).primaryColor;
    final Color progressBgColor = backgroundColor ?? Colors.grey.shade300;

    switch (variant) {
      case CustomProgressVariant.linear:
        return LinearProgressIndicator(
          value: value,
          valueColor: AlwaysStoppedAnimation<Color>(progressColor),
          backgroundColor: progressBgColor,
        );
      case CustomProgressVariant.circular:
        return SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            value: value,
            valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            backgroundColor: progressBgColor,
            strokeWidth: size / 10, 
          ),
        );
      case CustomProgressVariant.custom:
        
        if (value == null) {
          return const Text('Cargando...');
        }
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                value: value,
                valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                backgroundColor: progressBgColor,
                strokeWidth: 4.0,
              ),
            ),
            const SizedBox(width: 8),
            Text('${(value! * 100).toInt()}%', style: TextStyle(color: progressColor)),
          ],
        );
    }
  }
}
import 'package:flutter/material.dart';
import 'custom_badge.dart';

class CustomAlert extends StatelessWidget {
  final String message;
  final StatusVariant variant;
  final IconData? icon;
  final VoidCallback? onClose;

  const CustomAlert({
    super.key,
    required this.message,
    this.variant = StatusVariant.info,
    this.icon,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final Color baseColor = statusColors[variant]!;
    final Color lightColor = baseColor.withOpacity(0.15);
    final Color textColor = baseColor.withOpacity(0.9);

    IconData defaultIcon;
    switch (variant) {
      case StatusVariant.info:
        defaultIcon = Icons.info_outline;
        break;
      case StatusVariant.success:
        defaultIcon = Icons.check_circle_outline;
        break;
      case StatusVariant.warning:
        defaultIcon = Icons.warning_amber_rounded;
        break;
      case StatusVariant.error:
        defaultIcon = Icons.error_outline;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: lightColor,
        border: Border.all(color: baseColor.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Icon(icon ?? defaultIcon, color: baseColor),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(message, style: TextStyle(color: textColor)),
          ),
          if (onClose != null)
            IconButton(
              icon: Icon(
                Icons.close,
                color: baseColor.withOpacity(0.7),
                size: 18,
              ),
              onPressed: onClose,
            ),
        ],
      ),
    );
  }
}

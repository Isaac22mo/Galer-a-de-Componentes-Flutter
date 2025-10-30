import 'package:flutter/material.dart';


enum StatusVariant { info, success, warning, error }


Map<StatusVariant, Color> statusColors = {
  StatusVariant.info: Colors.blue.shade700,
  StatusVariant.success: Colors.green.shade700,
  StatusVariant.warning: Colors.orange.shade700,
  StatusVariant.error: Colors.red.shade700,
};

class CustomBadge extends StatelessWidget {
  final String text;
  final StatusVariant variant;

  const CustomBadge({
    super.key,
    required this.text,
    this.variant = StatusVariant.info,
  });

  @override
  Widget build(BuildContext context) {
    
    final Color bgColor = statusColors[variant]!;
    final Color textColor = (bgColor.computeLuminance() > 0.5) ? Colors.black87 : Colors.white;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
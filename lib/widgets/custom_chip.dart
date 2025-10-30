import 'package:flutter/material.dart';

enum CustomChipVariant { standard, outlined, colored }

class CustomChip extends StatelessWidget {
  final String label;
  final CustomChipVariant variant;
  final VoidCallback? onDeleted;
  final bool selected;

  const CustomChip({
    super.key,
    required this.label,
    this.variant = CustomChipVariant.standard,
    this.onDeleted,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor;
    Color? labelColor;
    BorderSide borderSide = BorderSide.none;

    
    Color selectedColor = Colors.blue.shade100;
    Color selectedLabelColor = Colors.blue.shade900;

    switch (variant) {
      case CustomChipVariant.standard:
        backgroundColor = selected ? selectedColor : Colors.grey.shade200;
        labelColor = selected ? selectedLabelColor : Colors.black87;
        break;
      case CustomChipVariant.outlined:
        backgroundColor = selected ? selectedColor : Colors.transparent;
        labelColor = selected ? selectedLabelColor : Colors.black87;
        borderSide = BorderSide(
          color: selected ? Colors.blue.shade700 : Colors.grey,
          width: 1.0,
        );
        break;
      case CustomChipVariant.colored:
        backgroundColor = selected ? Colors.purple.shade700 : Colors.purple.shade100;
        labelColor = selected ? Colors.white : Colors.purple.shade900;
        break;
    }

    return RawChip(
      label: Text(label),
      labelStyle: TextStyle(color: labelColor),
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: borderSide,
      ),
      deleteIcon: onDeleted != null ? const Icon(Icons.close, size: 18) : null,
      onDeleted: onDeleted,
      onPressed: () {}, 
    );
  }
}
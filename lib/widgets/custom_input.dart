import 'package:flutter/material.dart';

enum CustomInputVariant { standard, outlined, filled }

class CustomInput extends StatelessWidget {
  final String hintText;
  final CustomInputVariant variant;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomInput({
    super.key,
    required this.hintText,
    this.variant = CustomInputVariant.outlined,
    this.prefixIcon,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    InputDecoration decoration = InputDecoration(
      hintText: hintText,
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      labelText: hintText, 
      contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      
      border: const UnderlineInputBorder(), 
    );

    switch (variant) {
      case CustomInputVariant.standard:
        
        break;
      case CustomInputVariant.outlined:
        
        decoration = decoration.copyWith(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        );
        break;
      case CustomInputVariant.filled:
        
        decoration = decoration.copyWith(
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none, 
          ),
          enabledBorder: OutlineInputBorder( // Para que se vea bien cuando no está enfocado
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder( // Borde de color al enfocar
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
          ),
        );
        break;
    }

    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: decoration,
    );
  }
}
import 'package:flutter/material.dart';

enum CustomAvatarVariant { circular, rounded, square }

class CustomAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final CustomAvatarVariant variant;
  final double size;
  final Color? backgroundColor;

  const CustomAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.variant = CustomAvatarVariant.circular,
    this.size = 50.0,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    double borderRadius;
    switch (variant) {
      case CustomAvatarVariant.circular:
        borderRadius = size / 2;
        break;
      case CustomAvatarVariant.rounded:
        borderRadius = size * 0.25;
        break;
      case CustomAvatarVariant.square:
        borderRadius = 0.0;
        break;
    }

    Widget content;
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      content = Image.network(
        imageUrl!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildInitials(),
      );
    } else {
      content = _buildInitials();
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.blueGrey,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: content,
      ),
    );
  }

  Widget _buildInitials() {
    return Center(
      child: Text(
        initials?.toUpperCase() ?? '?',
        style: TextStyle(
          color: Colors.white,
          fontSize: size / 2.5,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
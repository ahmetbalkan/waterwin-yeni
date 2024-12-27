import 'package:flutter/material.dart';

class IconCircleButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color backgroundColor;
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final double radius; // Circle radius

  const IconCircleButton({
    super.key,
    required this.onTap,
    required this.backgroundColor,
    required this.icon,
    required this.iconSize,
    required this.iconColor,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            size: iconSize,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}

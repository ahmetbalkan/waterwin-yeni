import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterwin_app/core/extentions/device_type_extention.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double padding;
  final Color backgroundColor;
  final Color? borderColor;
  final String text;
  final TextStyle textStyle;
  final IconData? icon; // Sola eklenebilir ikon
  final double? iconSize;
  final Color? iconColor;
  final bool isCompact; // İçeriğe göre genişlik ayarlama bayrağı
  final double? width; // Eklenen width parametresi

  const CustomButton({
    super.key,
    required this.onTap,
    required this.padding,
    required this.backgroundColor,
    this.borderColor,
    required this.text,
    required this.textStyle,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.isCompact = false, // Varsayılan olarak geniş olur.
    this.width, // Yeni width parametresi
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width, // Width sağlanmışsa kullanılır
        height: context.isTablet ? 75.h : 58.h,
        padding: EdgeInsets.symmetric(horizontal: padding),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(32.r),
        ),
        constraints: isCompact
            ? null
            : const BoxConstraints(
                minWidth: double.infinity,
              ), // Full genişlikten kaçınmak için null.
        child: Row(
          mainAxisSize: isCompact
              ? MainAxisSize.min
              : MainAxisSize.max, // İçeriğe göre genişliği ayarla.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: iconSize,
                color: iconColor,
              ),
              const SizedBox(width: 8.0), // İkon ile yazı arasındaki boşluk
            ],
            Text(
              text,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}

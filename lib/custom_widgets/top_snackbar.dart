import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';

class TopSnackBar extends StatelessWidget {
  final String message;
  final VoidCallback onClose;

  const TopSnackBar({
    super.key,
    required this.message,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: TColors.primary,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                message,
                style: TTextStyles.largeBold.copyWith(color: TColors.white),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, color: TColors.white),
              onPressed: onClose,
            ),
          ],
        ),
      ),
    );
  }
}

void showTopSnackBar(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 30.0,
      left: 0.0,
      right: 0.0,
      child: TopSnackBar(
        message: message,
        onClose: () {
          overlayEntry.remove();
        },
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 2), () {
    if (overlayEntry.mounted) {
      overlayEntry.remove();
    }
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';

Future<void> showCustomDialog({
  required BuildContext context,
  required Widget icon,
  required String title,
  required String description,
  required String confirmButtonText,
  required String cancelButtonText,
  required VoidCallback onConfirm,
  required VoidCallback onCancel,
}) async {
  await showDialog(
    context: context,
    barrierDismissible: false, // Dialog dışına tıklayınca kapanmasın
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Üst Kısım: Başlık ve Kapat Butonu
            Container(
              height: 70.0.h,
              decoration: BoxDecoration(
                color: TColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Başlık
                    Expanded(
                      child: Text(
                        title,
                        style: TTextStyles.xLargeMedium.copyWith(
                          color: TColors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Kapat İkonu
                    IconButton(
                      onPressed: onCancel,
                      icon: Icon(
                        FontAwesomeIcons.circleXmark,
                        size: 36.r,
                        color: TColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Orta Kısım: İkon, Başlık ve Açıklama
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: TColors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
                ),
              ),
              child: Column(
                children: [
                  const Space(),
                  icon,
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: Column(
                      children: [
                        Space(height: 4.h),
                        Text(
                          title,
                          style: TTextStyles.h5,
                          textAlign: TextAlign.center,
                        ),
                        Space(height: 16.h),
                        Text(
                          description,
                          style: TTextStyles.largeRegular,
                          textAlign: TextAlign.center,
                        ),
                        const Space(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Alt Kısım: Onayla ve Kapat Butonları
            Row(
              children: [
                // Onayla Butonu
                Expanded(
                  child: GestureDetector(
                    onTap: onConfirm,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16.r),
                      ),
                      child: Container(
                        height: 70.h,
                        alignment: Alignment.center,
                        color: TColors.primary,
                        child: Text(
                          confirmButtonText,
                          style: TTextStyles.largeBold
                              .copyWith(color: TColors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                // Kapat Butonu
                Expanded(
                  child: GestureDetector(
                    onTap: onCancel,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16.r),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        height: 70.h,
                        color: TColors.error,
                        child: Text(
                          cancelButtonText,
                          style: TTextStyles.largeBold
                              .copyWith(color: TColors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

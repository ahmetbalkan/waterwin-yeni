import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';

class BlurFullPageLoadingWidget extends StatelessWidget {
  final String loadingtext;
  const BlurFullPageLoadingWidget({
    super.key,
    required this.loadingtext,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w),
            child: Container(
              decoration: BoxDecoration(
                color: TColors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              height: 200.h,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 10.r,
                    strokeAlign: 1,
                    color: TColors.primary,
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    loadingtext,
                    style: TTextStyles.h5.copyWith(color: TColors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

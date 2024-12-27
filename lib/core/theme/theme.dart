import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      primaryColor: TColors.primary,
      fontFamily: "Urbanist",
      textTheme: TextTheme(
        bodyLarge: TTextStyles.largeRegular,
        bodyMedium: TTextStyles.mediumRegular,
        bodySmall: TTextStyles.smallRegular,
      ),
      scaffoldBackgroundColor: TColors.lightBackground,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
          iconTheme: IconThemeData(
            size: 24.sp,
            color: Colors.black,
          ),
          toolbarHeight: 72.h),
      tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelColor: TColors.white,
        unselectedLabelColor: TColors.black,
        labelStyle: TTextStyles.mediumRegular.copyWith(color: TColors.primary),
        unselectedLabelStyle:
            TTextStyles.mediumRegular.copyWith(color: TColors.textGrey),
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: TColors.primary,
              width: 2.w,
            ),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TTextStyles.largeRegular.copyWith(color: TColors.textGrey),
        labelStyle: TTextStyles.largeRegular.copyWith(color: TColors.black),
        fillColor: TColors.inputFillColor,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: 18.h,
          horizontal: 12.w,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.w),
          borderSide: const BorderSide(width: 2, color: TColors.buttonStroke),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.w),
          borderSide: const BorderSide(width: 2, color: TColors.primary),
        ),
      ));

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: TColors.primary,
    fontFamily: "Urbanist",
    textTheme: TextTheme(
      bodyLarge: TTextStyles.largeRegular,
      bodyMedium: TTextStyles.mediumRegular,
      bodySmall: TTextStyles.smallRegular,
    ),
    scaffoldBackgroundColor: TColors.darkBackground,
    appBarTheme: AppBarTheme(
        backgroundColor: TColors.darkBackground,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarHeight: 72.h),
  );
}

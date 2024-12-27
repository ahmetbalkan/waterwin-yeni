import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension DeviceTypeExtension on BuildContext {
  bool get isTablet {
    // Ekran genişliğini kontrol ederek tablet mi olduğunu belirle
    final screenWidth = ScreenUtil().screenWidth;
    return screenWidth >=
        600; // 600dp üzeri genişlik tablet olarak kabul edilir
  }
}

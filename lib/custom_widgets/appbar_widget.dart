import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:waterwin_app/core/constants/assets_constants.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    bool canPop = GoRouter.of(context).canPop();

    return Container(
      height: preferredSize.height,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Sol İkon (Geri Dön veya Logo)
          canPop
              ? IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(FontAwesomeIcons.angleLeft,
                      size: 24.sp, color: TColors.primary),
                )
              : Padding(
                  padding: EdgeInsets.only(left: 9.w), // Sol boşluk
                  child: Image.asset(
                    TAssetsConstants.logoBluePng,
                    height: 40.h, // Logonun boyutunu sabit tut
                    fit: BoxFit.contain,
                  ),
                ),
          // Ortadaki Başlık
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TTextStyles.h6.copyWith(
                  color: TColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(72.h);
}

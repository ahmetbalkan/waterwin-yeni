import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:waterwin_app/core/constants/assets_constants.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/sizes.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/appbar_widget.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';

class RefreshFailedPage extends StatelessWidget {
  const RefreshFailedPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBarWidget(title: "Your Session Ended"),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: TSizes.pagePaddingHorizontal,
                vertical: TSizes.pagePaddingVertical),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(TAssetsConstants.refreshreject,
                    height: 200.h, width: 200.w),
                Space(height: 20.h),
                Text(
                  "Your Session Ended",
                  style: TTextStyles.xLargeSemibold,
                  textAlign: TextAlign.center,
                ),
                Space(height: 20.h),
                Text(
                  "Your session has expired or logged in from a different device. Please log in again.",
                  style: TTextStyles.mediumRegular,
                  textAlign: TextAlign.center,
                ),
                Space(height: 20.h),
                CustomButton(
                  onTap: () {
                    context.go('/authwelcome');
                  },
                  padding: 50.w,
                  isCompact: true,
                  backgroundColor: TColors.primary,
                  text: "Go To Auth Page",
                  textStyle:
                      TTextStyles.mediumBold.copyWith(color: TColors.white),
                )
              ],
            ),
          )),
    );
  }
}

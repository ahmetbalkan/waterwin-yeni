import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:waterwin_app/core/constants/assets_constants.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/sizes.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';

class AuthWelcomePage extends StatelessWidget {
  const AuthWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: TSizes.pagePaddingHorizontal),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 1.sw,
                  minWidth: 1.sw,
                  maxHeight: 0.8.sh,
                ),
                child: Column(
                  // Expanded kaldırıldı ve Column düzeltildi
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 36.h),
                        SvgPicture.asset(
                          TAssetsConstants.logoBlue,
                          height: 80.h,
                          width: 80.w,
                        ),
                        SizedBox(height: 48.5.h),
                        Text(
                          "Let's Get Started!",
                          style: TTextStyles.h3,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          "Let's dive in into your account",
                          style: TTextStyles.xLargeRegular,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(height: 68.5.h),
                    Column(
                      children: [
                        CustomButton(
                          onTap: () => context.push('/register'),
                          padding: 16.w,
                          backgroundColor: TColors.primary,
                          text: "Sign up",
                          textStyle: TTextStyles.largeBold
                              .copyWith(color: TColors.white),
                        ),
                        SizedBox(height: 20.h),
                        CustomButton(
                          onTap: () => context.push('/login'),
                          padding: 16.w,
                          backgroundColor: TColors.buttonLight,
                          text: "Sign in",
                          textStyle: TTextStyles.largeBold
                              .copyWith(color: TColors.primary),
                        ),
                        SizedBox(height: 29.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Privacy Policy",
                              style: TTextStyles.mediumRegular.copyWith(
                                color: TColors.textGrey,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              "|",
                              style: TTextStyles.mediumRegular.copyWith(
                                color: TColors.textGrey,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              "Terms of Service",
                              style: TTextStyles.mediumRegular.copyWith(
                                color: TColors.textGrey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

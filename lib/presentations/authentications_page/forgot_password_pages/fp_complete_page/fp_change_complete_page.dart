import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterwin_app/core/constants/assets_constants.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/sizes.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';

class FpChangeCompletePage extends StatelessWidget {
  const FpChangeCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(TSizes.pagePaddingHorizontal),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Image.asset(TAssetsConstants.fpchangecomplete,
                            height: 200.h, width: 200.w)),
                    Text(
                      "You're All Set!",
                      style: TTextStyles.h3,
                    ),
                    Text(
                      "Your password has been successfully updated.",
                      style: TTextStyles.xLargeRegular,
                    ),
                  ],
                ),
              ),
              CustomButton(
                onTap: () => context.go('/authwelcome'),
                padding: 16.w,
                backgroundColor: TColors.primary,
                text: "Go to Login",
                textStyle: TTextStyles.largeBold.copyWith(color: TColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

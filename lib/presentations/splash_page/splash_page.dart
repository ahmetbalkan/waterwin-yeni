import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterwin_app/core/constants/assets_constants.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/presentations/splash_page/bloc/splash_cubit.dart';

class SplashPage extends StatefulWidget {
  final SplashCubit? splashCubit;

  const SplashPage({super.key, this.splashCubit});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SplashCubit _splashCubit;

  @override
  void initState() {
    super.initState();
    _splashCubit = widget.splashCubit ?? SplashCubit()
      ..checkAndRefreshToken();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _splashCubit,
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) async {
          if (state.status == SplashStatus.success) {
            GoRouter.of(context).go('/homepage');
          } else if (state.status == SplashStatus.gotoinformation) {
            GoRouter.of(context).go('/information');
          } else if (state.status == SplashStatus.failure) {
            final prefs = await SharedPreferences.getInstance();
            final isComplete = prefs.getBool('isOnboardingComplete') ?? false;
            if (isComplete) {
              context.go('/authwelcome');
            } else {
              context.go('/onboarding');
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: TColors.primary,
            body: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(TAssetsConstants.logoWhite,
                          height: 160.h, width: 160.w),
                      Space(height: 32.h),
                      Text(
                        "WaterWin",
                        style: TTextStyles.h2.copyWith(color: TColors.white),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: LottieBuilder.asset(
                    TAssetsConstants.loadingLottie,
                    width: 90.w,
                    height: 90.h,
                  ),
                ),
                Space(height: 80.h),
              ],
            ),
          );
        },
      ),
    );
  }
}

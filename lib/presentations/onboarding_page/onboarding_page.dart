import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterwin_app/core/constants/assets_constants.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';
import 'package:waterwin_app/presentations/onboarding_page/bloc/onboarding_cubit.dart';

class OnboardingPage extends StatefulWidget {
  final OnboardingCubit? onboardingCubit;
  const OnboardingPage({super.key, this.onboardingCubit});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

late PageController _pageController;
late final OnboardingCubit _historyCubit;

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    _pageController = PageController();
    _historyCubit = widget.onboardingCubit ?? OnboardingCubit();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _historyCubit,
      child: SafeArea(
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: TColors.primary,
              body: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (value) {
                  _historyCubit.selectPage(value);
                },
                children: [
                  OnboardingWidget(
                    state: state,
                    image: TAssetsConstants.onboarding1,
                    title: "Hydrate & Earn Rewards!",
                    description:
                        "Begin your hydration journey today! Track progress, set goals, and earn rewards for every sip. Invite friends to multiply your earnings while staying healthy.",
                    continueText: "Next",
                    onContinue: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  OnboardingWidget(
                    state: state,
                    image: TAssetsConstants.onboarding2,
                    title: "Monitor & Boost Rewards",
                    description:
                        "Keep track of your water intake and stay consistent with reminders. Earn points for each sip and unlock extra rewards by inviting friends.",
                    continueText: "Next",
                    onContinue: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  OnboardingWidget(
                    state: state,
                    image: TAssetsConstants.onboarding3,
                    title: "Earn Money for Hydrating",
                    description:
                        "Convert hydration points into real cash when you reach \$10. Plus, earn 10% from your referrals’ rewards. Stay healthy and achieve your goals effortlessly.",
                    continueText: "Finish",
                    onContinue: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('isOnboardingComplete', true);
                      context.go("/authwelcome");
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class OnboardingWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String continueText;
  final OnboardingState state;
  final Function() onContinue;

  const OnboardingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.onContinue,
    required this.continueText,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Image.asset(
                  image,
                  width: 1.sw,
                  height: 1.sh,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomPaint(
                painter: CurvedPainter(),
                child: Container(
                  width: 1.sw,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 54.h),
                      Text(
                        title,
                        maxLines: 2,
                        style: TTextStyles.h3,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        description,
                        style: TTextStyles.largeRegular,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildDot(isSelected: state.page == 0),
                          SizedBox(width: 8.w),
                          _buildDot(isSelected: state.page == 1),
                          SizedBox(width: 8.w),
                          _buildDot(isSelected: state.page == 2),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: CustomButton(
                              onTap: () async {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.setBool(
                                    'isOnboardingComplete', true);
                                context.go("/authwelcome");
                              },
                              padding: 16.w,
                              backgroundColor: TColors.buttonLight,
                              text: "Skip",
                              textStyle: TTextStyles.largeBold
                                  .copyWith(color: TColors.primary),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: CustomButton(
                              onTap: onContinue,
                              padding: 16.w,
                              backgroundColor: TColors.primary,
                              text: continueText,
                              textStyle: TTextStyles.largeBold
                                  .copyWith(color: TColors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 36.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDot({required bool isSelected}) {
    return Container(
      width: isSelected ? 40.w : 10.w,
      height: 10.h,
      decoration: BoxDecoration(
        color: isSelected ? TColors.primary : TColors.buttonLight,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = TColors.white
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.2,
      size.width,
      0,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterwin_app/core/constants/assets_constants.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_bloc.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_state.dart';

class CalculateFinishPage extends StatefulWidget {
  final VoidCallback adjust;

  const CalculateFinishPage({super.key, required this.adjust});

  @override
  State<CalculateFinishPage> createState() => _CalculateFinishPageState();
}

class _CalculateFinishPageState extends State<CalculateFinishPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InformationBloc, InformationState>(
      listener: (context, state) {
        if (state.status == const InformationStatus.addInformationComplete()) {
          context.go("/homepage");
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(24.0.w),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Başlık
                    Text(
                      "Your daily goal is",
                      style: TTextStyles.h3,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                    // Space between elements
                    Space(height: 20.h),

                    // Bardak Resmi ve mL gösterimi
                    Column(
                      children: [
                        SvgPicture.asset(TAssetsConstants.finishbottle,
                            height: 120.w),
                        Space(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${state.waterIntake.toInt()}',
                              style: TTextStyles.h2.copyWith(fontSize: 80.sp),
                              textAlign: TextAlign.center,
                            ),
                            Space(width: 8.w),
                            Text(
                              ' mL',
                              style: TTextStyles.xLargeRegular,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      ],
                    ),
                    // Adjust button
                    GestureDetector(
                      onTap: widget.adjust,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: TColors.buttonStroke),
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.edit, color: TColors.black),
                            Space(width: 8.w),
                            Text('Adjust', style: TTextStyles.xLargeSemibold),
                          ],
                        ),
                      ),
                    ),

                    // Bottom button
                  ],
                ),
              ),
              CustomButton(
                onTap: state.status == const InformationStatus.loading()
                    ? null
                    : () {
                        context.read<InformationBloc>().addInformation();
                      },
                padding: 16.w,
                backgroundColor: TColors.primary,
                text: state.status == const InformationStatus.loading()
                    ? "Processing information"
                    : "Let’s Hydrate!",
                textStyle: TTextStyles.largeBold.copyWith(color: TColors.white),
              ),
              Space(height: 24.h),
            ],
          ),
        );
      },
    );
  }
}

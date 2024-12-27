import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/sizes.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_bloc.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_state.dart';

class GenderWidget extends StatefulWidget {
  final void Function(int) onNext;
  final String nextButtonText;

  const GenderWidget({
    super.key,
    required this.onNext,
    required this.nextButtonText,
  });

  @override
  GenderWidgetState createState() => GenderWidgetState();
}

class GenderWidgetState extends State<GenderWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InformationBloc, InformationState>(
      builder: (context, state) {
        if (state.status == const InformationStatus.loading()) {
          return const Center(child: CircularProgressIndicator());
        }

        return FittedBox(
          fit: BoxFit.scaleDown,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: TSizes.pagePaddingHorizontal,
                vertical: TSizes.pagePaddingVertical),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 1.sw,
                minWidth: 0.8.sw,
                maxHeight: 1.sh,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "What’s your gender?",
                          style: TTextStyles.h3,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
                        Space(height: 8.h),
                        Text(
                          "WaterWin is here to tailor a hydration plan just for you! Let's kick things off by getting to know you better.",
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: TTextStyles.xLargeRegular,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildGenderOption(
                                    context,
                                    icon: Icons.male,
                                    label: 'Male',
                                    genderValue: 1,
                                    isSelected: state.gender == 1,
                                    selectedColor: TColors.man,
                                    radius: 70.r,
                                  ),
                                  _buildGenderOption(
                                    context,
                                    icon: Icons.female,
                                    label: 'Female',
                                    genderValue: 2,
                                    isSelected: state.gender == 2,
                                    selectedColor: TColors.woman,
                                    radius: 70.r,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              CustomButton(
                                isCompact: true,
                                onTap: () => context
                                    .read<InformationBloc>()
                                    .updateField(
                                        fieldName: "gender", newValue: 3),
                                borderColor: Color(0xFFE0E0E0),
                                padding: 24.w,
                                backgroundColor: state.gender == 3
                                    ? Colors.black
                                    : TColors.buttonLight,
                                text: 'Prefer not to say',
                                textStyle: TTextStyles.xLargeSemibold.copyWith(
                                    color: state.gender == 3
                                        ? Colors.white
                                        : TColors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    onTap: () => widget.onNext(state.gender),
                    padding: 16.w,
                    backgroundColor: TColors.primary,
                    text: widget.nextButtonText,
                    textStyle:
                        TTextStyles.largeBold.copyWith(color: TColors.white),
                  ),
                  Space(height: 24.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGenderOption(
    BuildContext context, {
    required IconData icon,
    required final double radius,
    required String label,
    required int genderValue,
    required bool isSelected,
    required Color selectedColor,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => context
              .read<InformationBloc>()
              .updateField(fieldName: "gender", newValue: genderValue),
          child: Container(
            width: radius * 2,
            height: radius * 2,
            decoration: BoxDecoration(
              color: isSelected ? selectedColor : TColors.buttonLight,
              border: Border.all(
                color: isSelected ? selectedColor : Color(0xFFE0E0E0),
                width: 2.w,
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                icon,
                size: 60.w,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          label,
          style: TTextStyles.h4medium.copyWith(
            color: isSelected ? selectedColor : TColors.textGrey,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/sizes.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/custom_widgets/top_snackbar.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_bloc.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_state.dart';

class ActivityLevelPage extends StatefulWidget {
  final String nextButtonText;
  final void Function(int) onNext;
  final InformationBloc? informationBloc;

  const ActivityLevelPage({
    super.key,
    required this.onNext,
    required this.nextButtonText,
    this.informationBloc,
  });

  @override
  ActivityLevelPageState createState() => ActivityLevelPageState();
}

class ActivityLevelPageState extends State<ActivityLevelPage> {
  late final InformationBloc _informationBloc;

  @override
  void initState() {
    super.initState();
    _informationBloc = widget.informationBloc ?? InformationBloc()
      ..getInformation();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _informationBloc,
      child: BlocBuilder<InformationBloc, InformationState>(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "What's your activity level?",
                            style: TTextStyles.h3,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),
                          Space(height: 8.h),
                          Text(
                            "Choose the option that best describes your activity level for a personalized hydration plan:",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TTextStyles.xLargeRegular,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildActivityButton(
                                  context,
                                  title: "Light Activity",
                                  description:
                                      "Some movement throughout the day, such as light walking or occasional standing.",
                                  index: 0,
                                  selected: state.activityLevel == 0,
                                  icon: "🚶",
                                ),
                                Space(height: 16.w),
                                _buildActivityButton(
                                  context,
                                  title: "Moderate Active",
                                  description:
                                      "Regular exercise or physical activity, such as jogging or cycling.",
                                  index: 1,
                                  selected: state.activityLevel == 1,
                                  icon: "🏃‍♂️",
                                ),
                                Space(height: 16.w),
                                _buildActivityButton(
                                  context,
                                  title: "Very Active",
                                  description:
                                      "Intense physical activity or training, such as heavy lifting or high-intensity training.",
                                  index: 2,
                                  selected: state.activityLevel == 2,
                                  icon: "🏋️‍♂️",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      onTap: () {
                        widget.onNext(state.activityLevel);
                      },
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
      ),
    );
  }

  Widget _buildActivityButton(
    BuildContext context, {
    required String title,
    required String description,
    required int index,
    required bool selected,
    required String icon,
  }) {
    return GestureDetector(
      onTap: () {
        context
            .read<InformationBloc>()
            .updateField(fieldName: "activityLevel", newValue: index);
      },
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: selected ? TColors.primary : Colors.grey[300]!,
            width: selected ? 2.w : 1.w,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                icon,
                style: TTextStyles.h2,
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TTextStyles.h5.copyWith(
                        color: selected ? TColors.primary : Colors.black),
                  ),
                  Space(height: 8.w),
                  Text(
                    description,
                    maxLines: 2,
                    style: TTextStyles.largeRegular
                        .copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

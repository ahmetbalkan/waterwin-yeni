import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterwin_app/core/constants/assets_constants.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/sizes.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/custom_widgets/top_snackbar.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_bloc.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_state.dart';

class WeatherPage extends StatefulWidget {
  final String nextButtonText;
  final void Function(int) onNext;
  final InformationBloc? informationBloc;

  const WeatherPage({
    super.key,
    required this.onNext,
    required this.nextButtonText,
    this.informationBloc,
  });

  @override
  WeatherPageState createState() => WeatherPageState();
}

class WeatherPageState extends State<WeatherPage> {
  late final InformationBloc _informationBloc;

  @override
  void initState() {
    _informationBloc = widget.informationBloc ?? InformationBloc()
      ..getInformation();
    super.initState();
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
                            "What’s the climate/weather like in your area?",
                            style: TTextStyles.h3,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                          Space(height: 12.h),
                          Text(
                            "External factors like weather can influence your hydration needs. Let us know the current climate in your area:",
                            style: TTextStyles.xLargeRegular,
                            textAlign: TextAlign.center,
                            maxLines: 3,
                          ),
                          Space(height: 20.h),
                          Expanded(
                            child: ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                _buildWeatherOption(
                                  context,
                                  title: "Hot",
                                  svgIcon: TAssetsConstants.hot,
                                  index: 0,
                                  selected: state.weather == 0,
                                ),
                                Space(height: 16.h),
                                _buildWeatherOption(
                                  context,
                                  title: "Temperate",
                                  svgIcon: TAssetsConstants.temperate,
                                  index: 1,
                                  selected: state.weather == 1,
                                ),
                                Space(height: 16.h),
                                _buildWeatherOption(
                                  context,
                                  title: "Cold",
                                  svgIcon: TAssetsConstants.cold,
                                  index: 2,
                                  selected: state.weather == 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      onTap: () {
                        if (state.weather != -1) {
                          widget.onNext(state.weather);
                        } else {
                          showTopSnackBar(
                              context, 'Please select a weather option.');
                        }
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

  Widget _buildWeatherOption(
    BuildContext context, {
    required String title,
    required String svgIcon,
    required int index,
    required bool selected,
  }) {
    return GestureDetector(
      onTap: () {
        context
            .read<InformationBloc>()
            .updateField(fieldName: "weather", newValue: index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: selected ? TColors.primary : Colors.grey[300]!,
            width: selected ? 2.w : 1.w,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              svgIcon,
              height: 40.w,
              width: 40.w,
            ),
            Space(width: 16.w),
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                style: TTextStyles.h5.copyWith(
                  color: selected ? TColors.primary : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

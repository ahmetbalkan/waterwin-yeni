import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/sizes.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/custom_dialog_widget.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_bloc.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_state.dart';
import 'package:waterwin_app/presentations/information_page/presentations/pages/activity_level_widget.dart';
import 'package:waterwin_app/presentations/information_page/presentations/pages/age_widget.dart';
import 'package:waterwin_app/presentations/information_page/presentations/pages/calculate_finish_widget.dart';
import 'package:waterwin_app/presentations/information_page/presentations/pages/calculate_widget.dart';
import 'package:waterwin_app/presentations/information_page/presentations/pages/gender_widget.dart';
import 'package:waterwin_app/presentations/information_page/presentations/pages/height_widget.dart';
import 'package:waterwin_app/presentations/information_page/presentations/pages/name_widget.dart';
import 'package:waterwin_app/presentations/information_page/presentations/pages/phone_widget.dart';
import 'package:waterwin_app/presentations/information_page/presentations/pages/sleep_time_widget.dart';
import 'package:waterwin_app/presentations/information_page/presentations/pages/wake_up_time.dart';
import 'package:waterwin_app/presentations/information_page/presentations/pages/weather_page.dart';
import 'package:waterwin_app/presentations/information_page/presentations/pages/weight_widget.dart';
import 'package:waterwin_app/presentations/onboarding_page/onboarding_page.dart';

class InformationPage extends StatefulWidget {
  final InformationBloc? informationBloc;

  const InformationPage({super.key, this.informationBloc});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final PageController _pageController = PageController();
  late final InformationBloc _informationBloc;

  @override
  void initState() {
    _informationBloc = widget.informationBloc ?? InformationBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _informationBloc,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              BlocBuilder<InformationBloc, InformationState>(
                builder: (context, state) {
                  // İlk 10 sayfa için geri butonu ve progress bar'ı göster
                  if (state.currentPage <= 10) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: TSizes.pagePaddingHorizontal,
                          vertical: TSizes.pagePaddingVertical),
                      height: 72.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Visibility(
                            visible: state.currentPage > 1,
                            child: Center(
                              child: GestureDetector(
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 32.r,
                                ),
                                onTap: () {
                                  if (state.currentPage > 1) {
                                    _pageController.previousPage(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeInOut);
                                    context
                                        .read<InformationBloc>()
                                        .changePage(state.currentPage - 1);
                                  }
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40.w),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 12.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.r),
                                      color: TColors.buttonLight,
                                    ),
                                  ),
                                  LayoutBuilder(
                                    builder: (context, constraints) {
                                      return Container(
                                        height: 12.h,
                                        width: constraints.maxWidth *
                                            (state.currentPage / 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: TColors.primary,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            '${state.currentPage}/10',
                            style: TTextStyles.h5,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox
                        .shrink(); // Geri butonu ve progress bar gizlenir
                  }
                },
              ),
              Expanded(
                child: BlocBuilder<InformationBloc, InformationState>(
                  builder: (context, state) {
                    return PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (pageIndex) {
                        context
                            .read<InformationBloc>()
                            .changePage(pageIndex + 1);
                      },
                      children: [
                        GenderWidget(
                          nextButtonText: "Next",
                          onNext: (value) {
                            context.read<InformationBloc>().updateField(
                                fieldName: "gender", newValue: value);

                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                        ),
                        HeightWidget(
                          nextButtonText: "Next",
                          onNext: (value) {
                            context.read<InformationBloc>().updateField(
                                fieldName: "height", newValue: value);
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                        ),
                        WeightPage(
                          nextButtonText: "Next",
                          onNext: (value) {
                            context.read<InformationBloc>().updateField(
                                fieldName: "weight", newValue: value);
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                        ),
                        AgePage(
                          nextButtonText: "Next",
                          onNext: (value) {
                            context
                                .read<InformationBloc>()
                                .updateField(fieldName: "age", newValue: value);
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                        ),
                        WakeUpTimePage(
                          nextButtonText: "Next",
                          onNext: (value) {
                            context
                                .read<InformationBloc>()
                                .changePage(state.currentPage + 1);
                            context.read<InformationBloc>().updateField(
                                fieldName: "wakeUpTime", newValue: value);
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                        ),
                        SleepTimePage(
                          nextButtonText: "Next",
                          onNext: (value) {
                            context.read<InformationBloc>().updateField(
                                fieldName: "sleepTime", newValue: value);
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                        ),
                        ActivityLevelPage(
                          nextButtonText: "Next",
                          onNext: (value) {
                            context.read<InformationBloc>().updateField(
                                fieldName: "activityLevel", newValue: value);
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                        ),
                        WeatherPage(
                          nextButtonText: "Next",
                          onNext: (value) {
                            context.read<InformationBloc>().updateField(
                                fieldName: "weather", newValue: value);
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                        ),
                        NameWidget(
                          nextButtonText: "Next",
                          onNext: (value) {
                            context.read<InformationBloc>().updateField(
                                fieldName: "name", newValue: value);
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                        ),
                        PhoneWidget(
                          nextButtonText: "Calculate",
                          onNext: (value) {
                            context.read<InformationBloc>().updateField(
                                fieldName: "phoneNumber", newValue: value);
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                        ),
                        CalculatePage(
                          onCalculationComplete: () {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                        ),
                        CalculateFinishPage(
                          adjust: () {
                            showCustomDialog(
                                context: context,
                                icon: const Icon(
                                  FontAwesomeIcons.circleExclamation,
                                  color: TColors.error,
                                ),
                                title: "Returning to the Beginning",
                                description:
                                    "Are you sure you want to go back to the beginning?",
                                confirmButtonText: "Confirm",
                                cancelButtonText: "Cancel",
                                onConfirm: () {
                                  context.pop();
                                  _pageController.jumpToPage(0);
                                },
                                onCancel: () => Navigator.pop(context));
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

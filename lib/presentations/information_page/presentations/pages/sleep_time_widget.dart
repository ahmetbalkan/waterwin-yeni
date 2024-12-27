import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/sizes.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_bloc.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_state.dart';

class SleepTimePage extends StatefulWidget {
  final String nextButtonText;
  final void Function(String) onNext;
  final InformationBloc? informationBloc;

  const SleepTimePage({
    super.key,
    required this.onNext,
    required this.nextButtonText,
    this.informationBloc,
  });

  @override
  SleepTimePageState createState() => SleepTimePageState();
}

class SleepTimePageState extends State<SleepTimePage> {
  late final InformationBloc _informationBloc;
  late FixedExtentScrollController _hourController;
  late FixedExtentScrollController _minuteController;

  @override
  void initState() {
    super.initState();
    _informationBloc = widget.informationBloc ?? InformationBloc()
      ..getInformation();
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    super.dispose();
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

          final sleepTimeParts = state.sleepTime.split(":");
          final initialHour = int.parse(sleepTimeParts[0]);
          final initialMinute = int.parse(sleepTimeParts[1]);

          _hourController =
              FixedExtentScrollController(initialItem: initialHour);
          _minuteController =
              FixedExtentScrollController(initialItem: initialMinute);

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
                            "What time do you usually go to bed?",
                            style: TTextStyles.h3,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                          Space(height: 8.h),
                          Text(
                            "Your bedtime influences your hydration pattern. Choose your typical bedtime:",
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            style: TTextStyles.xLargeRegular,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: HourPickerWidget(
                                    scrollController: _hourController,
                                    onSelectedItemChanged: (int hour) {
                                      context
                                          .read<InformationBloc>()
                                          .updateField(
                                            fieldName: "sleepTime",
                                            newValue:
                                                "${hour.toString().padLeft(2, '0')}:${state.sleepTime.split(":")[1]}:00", // Saniye sabit "00"
                                          );
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: MinutePickerWidget(
                                    scrollController: _minuteController,
                                    onSelectedItemChanged: (int minute) {
                                      context
                                          .read<InformationBloc>()
                                          .updateField(
                                            fieldName: "sleepTime",
                                            newValue:
                                                "${state.sleepTime.split(":")[0]}:${minute.toString().padLeft(2, '0')}:00", // Saniye sabit "00"
                                          );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      onTap: () => widget.onNext(state.sleepTime),
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
}

class HourPickerWidget extends StatelessWidget {
  final ValueChanged<int> onSelectedItemChanged;
  final FixedExtentScrollController scrollController;

  const HourPickerWidget({
    super.key,
    required this.onSelectedItemChanged,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      itemExtent: 50.w,
      squeeze: 1.1,
      scrollController: scrollController,
      onSelectedItemChanged: (int index) {
        onSelectedItemChanged(index);
      },
      children: List<Widget>.generate(24, (int index) {
        int hour = index;
        return Text(
          '${hour.toString().padLeft(2, '0')}',
          style: TTextStyles.h2,
        );
      }),
    );
  }
}

class MinutePickerWidget extends StatelessWidget {
  final ValueChanged<int> onSelectedItemChanged;
  final FixedExtentScrollController scrollController;

  const MinutePickerWidget({
    super.key,
    required this.onSelectedItemChanged,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      itemExtent: 50.w,
      squeeze: 1.1,
      scrollController: scrollController,
      onSelectedItemChanged: (int index) {
        onSelectedItemChanged(index);
      },
      children: List<Widget>.generate(60, (int index) {
        int minute = index;
        return Text(
          '${minute.toString().padLeft(2, '0')}',
          style: TTextStyles.h2,
        );
      }),
    );
  }
}

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

class WeightPage extends StatefulWidget {
  final String nextButtonText;
  final void Function(int) onNext;
  final InformationBloc? informationBloc;

  const WeightPage({
    super.key,
    required this.onNext,
    required this.nextButtonText,
    this.informationBloc,
  });

  @override
  WeightPageState createState() => WeightPageState();
}

class WeightPageState extends State<WeightPage> {
  late final InformationBloc _informationBloc;
  late FixedExtentScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _informationBloc = widget.informationBloc ?? InformationBloc()
      ..getInformation();
    _scrollController = FixedExtentScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
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

          _scrollController = FixedExtentScrollController(
            initialItem: (state.weight - 30).clamp(0, 149),
          );

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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "What is your weight?",
                            style: TTextStyles.h3,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),
                          Space(height: 8.h),
                          Text(
                            "Your weight is crucial in creating a tailored hydration plan. Choose your weight measurement:",
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            style: TTextStyles.xLargeRegular,
                          ),
                          Expanded(
                            child: WeightPickerWidget(
                              scrollController: _scrollController,
                              onSelectedItemChanged: (int weight) {
                                context.read<InformationBloc>().updateField(
                                    fieldName: "weight", newValue: weight);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      onTap: () => widget.onNext(state.weight),
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

class WeightPickerWidget extends StatelessWidget {
  final ValueChanged<int> onSelectedItemChanged;
  final FixedExtentScrollController scrollController;

  const WeightPickerWidget({
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
        onSelectedItemChanged(index + 30);
      },
      children: List<Widget>.generate(201, (int index) {
        int weight = index + 30;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$weight ',
              style: TTextStyles.h2,
            ),
            Text(
              'KG',
              style: TTextStyles.h6,
            ),
          ],
        );
      }),
    );
  }
}

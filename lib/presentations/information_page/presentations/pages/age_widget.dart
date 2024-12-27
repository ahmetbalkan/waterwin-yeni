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

class AgePage extends StatefulWidget {
  final void Function(int) onNext;
  final String nextButtonText;
  final InformationBloc? informationBloc;

  const AgePage({
    super.key,
    required this.onNext,
    required this.nextButtonText,
    this.informationBloc,
  });

  @override
  AgePageState createState() => AgePageState();
}

class AgePageState extends State<AgePage> {
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

          // Yaş seçici için başlangıç yaşını ayarla
          _scrollController = FixedExtentScrollController(
            initialItem: (state.age - 1).clamp(0, 99),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "What's your age?",
                            style: TTextStyles.h3,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),
                          Space(height: 8.h),
                          Text(
                            "Age also has an impact on your body's hydration needs. Scroll and select your age from the options below:",
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            style: TTextStyles.xLargeRegular,
                          ),
                          Expanded(
                            child: AgePickerWidget(
                              scrollController: _scrollController,
                              onSelectedItemChanged: (int age) {
                                context.read<InformationBloc>().updateField(
                                      fieldName: "age",
                                      newValue: age,
                                    );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      onTap: () => widget.onNext(state.age),
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

class AgePickerWidget extends StatelessWidget {
  final ValueChanged<int> onSelectedItemChanged;
  final FixedExtentScrollController scrollController;

  const AgePickerWidget({
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
        onSelectedItemChanged(index + 1); // Yaş 1'den başlıyor
      },
      children: List<Widget>.generate(100, (int index) {
        int age = index + 1;
        return Text(
          '$age',
          style: TTextStyles.h2,
        );
      }),
    );
  }
}

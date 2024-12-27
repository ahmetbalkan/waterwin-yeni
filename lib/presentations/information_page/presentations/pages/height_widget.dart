import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waterwin_app/core/constants/assets_constants.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/sizes.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_bloc.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_state.dart';

class HeightWidget extends StatefulWidget {
  final String nextButtonText;
  final void Function(int) onNext;

  const HeightWidget({
    super.key,
    required this.onNext,
    required this.nextButtonText,
  });

  @override
  HeightWidgetState createState() => HeightWidgetState();
}

class HeightWidgetState extends State<HeightWidget> {
  late FixedExtentScrollController _scrollController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InformationBloc, InformationState>(
      builder: (context, state) {
        if (state.status == const InformationStatus.loading()) {
          return const Center(child: CircularProgressIndicator());
        }

        _scrollController = FixedExtentScrollController(
          initialItem: (state.height - 50).clamp(0, 200), // to avoid overflow
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "How tall are you?",
                                style: TTextStyles.h3,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        Space(height: 8.h),
                        Text(
                          "Your height is another key factor in customizing your hydration plan. Choose your height measurement:",
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: TTextStyles.xLargeRegular,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16.h),
                                      child: SvgPicture.asset(
                                        state.gender == 1
                                            ? TAssetsConstants.man
                                            : state.gender == 2
                                                ? TAssetsConstants.woman
                                                : TAssetsConstants.undefined,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: HeightPickerWidget(
                                  scrollController: _scrollController,
                                  onSelectedItemChanged: (int height) {
                                    context.read<InformationBloc>().updateField(
                                        fieldName: "height", newValue: height);
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
                    onTap: () => widget.onNext(state.height),
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
}

class HeightPickerWidget extends StatelessWidget {
  final ValueChanged<int> onSelectedItemChanged;
  final FixedExtentScrollController scrollController;

  const HeightPickerWidget({
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
        onSelectedItemChanged(index + 50);
      },
      children: List<Widget>.generate(201, (int index) {
        int height = index + 50;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$height ',
              style: TTextStyles.h2,
            ),
            Text(
              'CM',
              style: TTextStyles.h6,
            ),
          ],
        );
      }),
    );
  }
}

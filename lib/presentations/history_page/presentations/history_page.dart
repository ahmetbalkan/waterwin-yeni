import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waterwin_app/core/extentions/bottle_select_extentions.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/appbar_widget.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/presentations/history_page/presentations/bloc/history_cubit.dart';
import 'package:waterwin_app/core/extentions/datetime_extentions.dart';

class HistoryPage extends StatefulWidget {
  final HistoryCubit? historyCubit;
  const HistoryPage({super.key, this.historyCubit});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late final HistoryCubit _historyCubit;

  @override
  void initState() {
    super.initState();

    _historyCubit = widget.historyCubit ?? HistoryCubit();
  }

  @override
  void dispose() {
    _historyCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _historyCubit,
      child: BlocBuilder<HistoryCubit, HistoryState>(builder: (context, state) {
        return Scaffold(
          backgroundColor: TColors.lightBackground,
          appBar: AppBarWidget(
            title: "History",
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.5,
                        blurRadius: 1,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  width: 1.sw,
                  child: const HorizontalDateSelector(),
                ),
                Space(),
                SizedBox(
                  width: MediaQuery.of(context).size.width, // Ekran genişliği
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: ConstrainedBox(
                        // İçeriğin ne kadar büyüyüp/küçülebileceğini sınırlıyoruz
                        constraints: BoxConstraints(
                          maxWidth: 1.sw, // En fazla tam ekran genişliğinde
                          minWidth: 1.sw, // Minimum da tam ekran genişliğinde
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  state.points.isNotEmpty
                                      ? state.points.first.createdAt
                                              ?.toFormattedDate() ??
                                          ""
                                      : "No data available",
                                  style: TTextStyles.mediumBold,
                                ),
                                const Space(),
                                const Expanded(
                                  child: Divider(
                                    color: TColors.buttonStroke,
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                            const Space(),
                            Container(
                                padding: EdgeInsets.all(24.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.w),
                                  color: TColors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 16.w,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Recent Drinks",
                                          style: TTextStyles.h5.copyWith(
                                            color: TColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: TColors.buttonStroke,
                                      thickness: 1.w,
                                    ),
                                    state.points.isNotEmpty
                                        ? ListView.separated(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8.h),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: SvgPicture.asset(
                                                        state
                                                            .points[index]
                                                            .glasstype!
                                                            .svgAsset,
                                                        width: 40.w,
                                                        height: 40.w,
                                                      ),
                                                    ),
                                                    Space(
                                                      width: 24.w,
                                                    ),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Water",
                                                            style: TTextStyles
                                                                .h6
                                                                .copyWith(
                                                              color:
                                                                  TColors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          Text(
                                                            state.points[index]
                                                                .createdAt!
                                                                .toFormattedDateTime(),
                                                            style: TTextStyles
                                                                .smallRegular
                                                                .copyWith(
                                                              color: TColors
                                                                  .textGrey,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        "${state.points[index].wateramount} mL",
                                                        style: TTextStyles.h6
                                                            .copyWith(
                                                          color: TColors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            separatorBuilder:
                                                (context, index) => Divider(
                                              color: TColors.buttonStroke,
                                              thickness: 1.w,
                                            ),
                                            itemCount: state.points.length,
                                          )
                                        : Center(
                                            child: Text("No data available"),
                                          ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class DayProgressModel {
  final DateTime date;
  final double progress;

  DayProgressModel({required this.date, required this.progress});
}

class HorizontalDateSelector extends StatelessWidget {
  const HorizontalDateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 90.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  reverse: true,
                  itemCount: state.dates.length,
                  itemBuilder: (context, index) {
                    bool isSelected = state.selectedIndex == index;

                    return GestureDetector(
                      onTap: () {
                        context.read<HistoryCubit>().selectDate(index);
                        context
                            .read<HistoryCubit>()
                            .changeHistoryDate(state.dates[index].date);
                      },
                      child: Container(
                        width: 1.sw / 7,
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.blue.withOpacity(0.1)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: 30.w, // Yeni genişlik
                                  height: 30.w, // Yeni yükseklik
                                  child: CircularProgressIndicator(
                                    value: state.dates[index].progress,
                                    strokeWidth: 4,
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                      TColors.primary,
                                    ),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                                Text(
                                  '${state.dates[index].date.day}',
                                  style: TTextStyles.smallBold.copyWith(
                                    color: isSelected
                                        ? TColors.primary
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              _getWeekdayString(
                                  state.dates[index].date.weekday),
                              style: TTextStyles.smallBold.copyWith(
                                color: isSelected ? Colors.blue : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getWeekdayString(int weekday) {
    switch (weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }
}

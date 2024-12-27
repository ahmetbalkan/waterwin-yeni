import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/appbar_widget.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/presentations/account_page/presentations/payment_options_page/presentations/profit_list_page/presentations/bloc/profit_list_cubit.dart';

class ProfitListPage extends StatefulWidget {
  final ProfitListCubit? profitListCubit;

  const ProfitListPage({super.key, this.profitListCubit});

  @override
  State<ProfitListPage> createState() => _ProfitListPageState();
}

class _ProfitListPageState extends State<ProfitListPage> {
  late final ProfitListCubit _profitListCubit;

  @override
  void initState() {
    super.initState();
    _profitListCubit = widget.profitListCubit ?? ProfitListCubit();

    _profitListCubit.refreshProfitStatistics();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _profitListCubit,
      child: BlocBuilder<ProfitListCubit, ProfitListState>(
        builder: (context, state) {
          if (state.statisticsStatus == ProfitListStatus.loading) {
            return const Scaffold(
              appBar: AppBarWidget(
                title: "Earnings Statistics",
              ),
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final profitStatistics = state.profitStatistics ?? [];

          return Scaffold(
            appBar: const AppBarWidget(title: "Earnings Statistics"),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 16.h,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 16.h,
                      ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Monthly Statistics",
                                style: TTextStyles.h5.copyWith(
                                  color: TColors.black,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<ProfitListCubit>()
                                      .refreshProfitStatistics();
                                },
                                icon: Icon(
                                  FontAwesomeIcons.arrowRotateLeft,
                                  color: TColors.primary,
                                  size: 24.w,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: TColors.greyBackground,
                            thickness: 1.w,
                          ),
                          profitStatistics.isNotEmpty
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: profitStatistics.length,
                                  itemBuilder: (context, index) {
                                    final statistic = profitStatistics[index];
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.h),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Icon(
                                              IconlyLight.chart,
                                              size: 40.w,
                                              color: TColors.primary,
                                            ),
                                          ),
                                          Space(
                                            width: 24.w,
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Month: ${statistic.profitMonth}/${statistic.profitYear}",
                                                  style:
                                                      TTextStyles.h6.copyWith(
                                                    color: TColors.black,
                                                  ),
                                                ),
                                                Text(
                                                  "Total Points: ${statistic.totalPoints ?? 0}",
                                                  style: TTextStyles
                                                      .smallRegular
                                                      .copyWith(
                                                    color: TColors.textGrey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "${statistic.monthlyTotal?.toStringAsFixed(3) ?? '0.000'} \$",
                                                  style:
                                                      TTextStyles.h6.copyWith(
                                                    color: TColors.black,
                                                  ),
                                                ),
                                                Text(
                                                  "Ref: ${statistic.referanceTotal?.toStringAsFixed(3) ?? '0.000'} \$",
                                                  style: TTextStyles
                                                      .smallRegular
                                                      .copyWith(
                                                    color: TColors.textGrey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) => Divider(
                                    color: TColors.greyBackground,
                                    thickness: 1.w,
                                  ),
                                )
                              : Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.h),
                                    child: Text(
                                      "No statistics available.",
                                      style: TTextStyles.largeRegular
                                          .copyWith(color: TColors.textGrey),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
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

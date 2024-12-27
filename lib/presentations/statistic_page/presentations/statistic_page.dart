import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/appbar_widget.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/custom_widgets/top_snackbar.dart';
import 'package:waterwin_app/presentations/statistic_page/domain/model/model/bottle_model.dart';
import 'package:waterwin_app/presentations/statistic_page/domain/model/model/water_intake_model.dart';
import 'package:waterwin_app/presentations/statistic_page/presentations/bloc/statistic_cubit.dart';

class StatisticPage extends StatefulWidget {
  final StatisticCubit? statisticCubit;
  const StatisticPage({super.key, this.statisticCubit});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  late final StatisticCubit _historyCubit;

  @override
  void initState() {
    super.initState();
    _historyCubit = widget.statisticCubit ?? StatisticCubit();
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
      child: BlocBuilder<StatisticCubit, StatisticState>(
        builder: (context, state) {
          return BlocListener<StatisticCubit, StatisticState>(
            listener: (context, state) {
              if (state.status == StatisticStatus.error) {
                showTopSnackBar(context, state.message);
              }
            },
            child: Scaffold(
                appBar: const AppBarWidget(title: "Statistics"),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: 1.sw,
                        decoration: BoxDecoration(
                          color: TColors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 24.h),
                          child: Column(
                            children: [
                              Container(
                                width: 1.sw,
                                height: 50.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.w),
                                  color: TColors.lightBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 16.w,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: TabbarDemo(),
                              ),
                              const DateRangeSelector(),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                        ),
                        child: Column(
                          children: [
                            FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24.w, vertical: 16.h),
                                width: 1.sw,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Drink Types",
                                      style: TTextStyles.h5,
                                    ),
                                    Text(
                                      "You can see the amount of water you drink in ml.",
                                      style: TTextStyles.mediumRegular,
                                    ),
                                    Space(
                                      height: 4.h,
                                    ),
                                    const Divider(
                                      color: TColors.lightBackground,
                                    ),
                                    Space(
                                      height: 16.h,
                                    ),
                                    state.bottles.isEmpty
                                        ? Center(
                                            child: Text(
                                              "No data to show",
                                              style: TTextStyles.largeBold,
                                            ),
                                          )
                                        : WaterIntakeCircularChart(
                                            bottles: state.bottles,
                                          ),
                                    Space(
                                      height: 16.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Space(),
                            Container(
                              width: 1.sw,
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
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 24.h,
                                      left: 24.w,
                                      right: 24.w,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Percentage Data",
                                          style: TTextStyles.h5,
                                        ),
                                        Space(
                                          height: 4.h,
                                        ),
                                        Text(
                                          "You can see your water consumption rates as a percentage by days.",
                                          style: TTextStyles.mediumRegular,
                                        ),
                                        Space(
                                          height: 4.h,
                                        ),
                                        const Divider(
                                          color: TColors.lightBackground,
                                        ),
                                        Space(
                                          height: 4.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.h),
                                    child: state.tabStatus == TabStatus.all
                                        ? Center(
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 16.h),
                                                child: Column(
                                                  children: [
                                                    Icon(
                                                      FontAwesomeIcons
                                                          .circleExclamation,
                                                      color: TColors.primary,
                                                      size: 60.w,
                                                    ),
                                                    Space(),
                                                    Text(
                                                      "In this section you can only view weekly and monthly.",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          TTextStyles.largeBold,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        : WaterIntakeChart(
                                            waterIntakeData:
                                                state.dailyWaterIntakeData,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}

class DateRangeSelector extends StatelessWidget {
  const DateRangeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatisticCubit, StatisticState>(
      builder: (context, state) {
        final cubit = context.read<StatisticCubit>();

        // "All Time" selected, hide date range
        if (state.tabStatus == TabStatus.all) {
          return const SizedBox.shrink();
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                // Shift week or month based on the current tab status
                if (state.tabStatus == TabStatus.weekly) {
                  cubit.loadWeeklyWaterIntake(-1);
                } else if (state.tabStatus == TabStatus.monthly) {
                  cubit.loadMonthlyWaterIntake(-1);
                }
              },
              icon: const Icon(FontAwesomeIcons.angleLeft),
            ),
            Text(
              cubit.getFormattedDateRange(), // Get the current date range
              style: TTextStyles.h6,
            ),
            IconButton(
              onPressed: () {
                // Shift week or month based on the current tab status
                if (state.tabStatus == TabStatus.weekly) {
                  cubit.loadWeeklyWaterIntake(1);
                } else if (state.tabStatus == TabStatus.monthly) {
                  cubit.loadMonthlyWaterIntake(1);
                }
              },
              icon: const Icon(FontAwesomeIcons.angleRight),
            ),
          ],
        );
      },
    );
  }
}

class TabbarDemo extends StatelessWidget {
  const TabbarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatisticCubit, StatisticState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 3,
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.zero,
            dividerColor: Colors.transparent,
            indicator: const BoxDecoration(
              color: TColors.primary,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            labelColor: Colors.white,
            onTap: (value) {
              if (value == 0) {
                context.read<StatisticCubit>().loadAllWaterIntake();
              } else if (value == 1) {
                context.read<StatisticCubit>().loadWeeklyWaterIntake(0);
              } else if (value == 2) {
                context.read<StatisticCubit>().loadMonthlyWaterIntake(0);
              }
            },
            unselectedLabelColor: TColors.black,
            tabs: [
              Tab(
                height: 50.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "All",
                      overflow: TextOverflow.ellipsis,
                      style: TTextStyles.largeBold,
                    ),
                  ],
                ),
              ),
              Tab(
                height: 50.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Weekly",
                      overflow: TextOverflow.ellipsis,
                      style: TTextStyles.largeBold,
                    ),
                  ],
                ),
              ),
              Tab(
                height: 50.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Monthly",
                      overflow: TextOverflow.ellipsis,
                      style: TTextStyles.largeBold,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class WaterIntakeCircularChart extends StatelessWidget {
  final List<BottleModel> bottles;

  WaterIntakeCircularChart({super.key, required this.bottles});

  final List<Color> colors = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.yellow,
    Colors.brown,
    Colors.pink,
    Colors.cyan,
    Colors.teal,
    Colors.indigo,
    Colors.amber,
  ];

  @override
  Widget build(BuildContext context) {
    double total = bottles.fold(0, (sum, item) => sum + item.ml);
    List<double> percentages =
        bottles.map((bottle) => (bottle.ml / total) * 100).toList();

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 120.w,
            height: 120.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size(200.w, 200.w),
                  painter: WaterIntakePainter(
                      percentages: percentages,
                      bottles: bottles,
                      colors: colors),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('100%', style: TTextStyles.h4),
                    Text('Water Intake', style: TTextStyles.smallRegular),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              children: [
                for (int i = 0; i < bottles.length; i += 2)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Space(),
                      Expanded(child: _buildLegendItem(bottles[i], i)),
                      if (i + 1 < bottles.length) Space(width: 4.w),
                      if (i + 1 < bottles.length)
                        Expanded(
                            child: _buildLegendItem(bottles[i + 1], i + 1)),
                    ],
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLegendItem(BottleModel bottle, int index) {
    Color color = colors[index % colors.length];
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16.w,
          height: 16.w,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: color,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          bottle.name,
          style: TTextStyles.smallRegular,
        ),
      ],
    );
  }
}

class WaterIntakePainter extends CustomPainter {
  final List<double> percentages;
  final List<BottleModel> bottles;
  final List<Color> colors;

  WaterIntakePainter(
      {required this.percentages, required this.bottles, required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    double startAngle = -pi / 2; // Başlangıç açısı - yukarıdan başlar
    final radius = min(size.width / 2, size.height / 2);
    final strokeWidth = 12.0.w;

    for (int i = 0; i < percentages.length; i++) {
      final sweepAngle = 2 * pi * (percentages[i] / 100);

      final paint = Paint()
        ..color = colors[i % colors.length]
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap =
            StrokeCap.square; // Çizgilerin uçlarını yuvarlak yapıyoruz

      canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2), radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class WaterIntakeChart extends StatefulWidget {
  final List<WaterIntakeModel> waterIntakeData;

  const WaterIntakeChart({super.key, required this.waterIntakeData});

  @override
  WaterIntakeChartState createState() => WaterIntakeChartState();
}

class WaterIntakeChartState extends State<WaterIntakeChart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        children: [
          SizedBox(
            height: 320.w,
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              controller: ScrollController(
                  initialScrollOffset: widget.waterIntakeData.length * 60.0),
              scrollDirection: Axis.horizontal,
              itemCount: widget.waterIntakeData.length,
              itemBuilder: (context, index) {
                return _buildBar(context, widget.waterIntakeData[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBar(BuildContext context, WaterIntakeModel data) {
    double percentage = (data.current / data.dailyLimit) * 100;
    if (percentage > 100) {
      percentage = 100;
    }
    bool isHighlighted = DateTime.now().day == data.date.day;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          Text(
            '${percentage.toInt()}%',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Space(),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 200.h,
                width: 30.w,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: data.current < 1500
                    ? Center(
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            '${(data.current / 1000).toStringAsFixed(1)} L',
                            style: TTextStyles.mediumBold,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              Container(
                height: (percentage * 1.5).h,
                width: 30.w,
                decoration: BoxDecoration(
                  color: percentage == 100
                      ? Colors.green
                      : (isHighlighted ? Colors.blue : Colors.blue[300]),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: data.current > 1500
                    ? Center(
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            '${(data.current / 1000).toStringAsFixed(1)} L ',
                            style: TTextStyles.mediumBold.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
          const Space(),
          Text('${data.date.day}/${data.date.month}',
              style: const TextStyle(fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}

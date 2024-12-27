import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/appbar_widget.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/presentations/point_page/presentations/bloc/point_cubit.dart';

class PointPage extends StatefulWidget {
  final PointCubit? pointCubit;

  const PointPage({super.key, this.pointCubit});

  @override
  State<PointPage> createState() => _PointPageState();
}

class _PointPageState extends State<PointPage> {
  late final PointCubit _pointCubit;

  @override
  void initState() {
    _pointCubit = widget.pointCubit ?? PointCubit()
      ..getReferalAndUserPoints();
    super.initState();
  }

  @override
  void dispose() {
    _pointCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Ekran boyutu hesaplamalarını yapabilmek için ScreenUtil.init veya benzeri bir yapı kullanıyorsanız emin olun.
    // Örneğin:
    //   ScreenUtil.init(
    //     BoxConstraints(maxWidth: MediaQuery.of(context).size.width,
    //                   maxHeight: MediaQuery.of(context).size.height),
    //   ...
    // );

    return BlocProvider.value(
      value: _pointCubit,
      child: BlocBuilder<PointCubit, PointState>(
        builder: (context, state) {
          return Scaffold(
            appBar: const AppBarWidget(
              title: "Points",
            ),
            body: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width, // Ekran genişliği
                height: MediaQuery.of(context).size.height, // Ekran yüksekliği
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                      horizontal: 16.w,
                    ),
                    child: ConstrainedBox(
                      // İçeriğin ne kadar büyüyüp/küçülebileceğini sınırlıyoruz
                      constraints: BoxConstraints(
                        maxWidth: 1.sw, // En fazla tam ekran genişliğinde
                        minWidth: 1.sw, // Minimum da tam ekran genişliğinde
                        maxHeight: 0.8.sh,
                      ),
                      child: Column(
                        children: [
                          // 1) Güncel puanları gösteren Container
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.h, horizontal: 16.w),
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
                                /// "Current Points" başlığı ve refresh ikonu
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Current Points",
                                      style: TTextStyles.h5,
                                    ),
                                    IconButton(
                                      onPressed: state.isButtonEnabled
                                          ? () {
                                              context
                                                  .read<PointCubit>()
                                                  .getReferalAndUserPointsWithDelay();
                                            }
                                          : null,
                                      icon: Icon(
                                        FontAwesomeIcons.arrowRotateLeft,
                                        size: 24.sp,
                                        color: state.isButtonEnabled
                                            ? TColors.primary
                                            : TColors.error,
                                      ),
                                    ),
                                  ],
                                ),

                                Center(
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: state.totalPoints.toString(),
                                          style: TTextStyles.h2,
                                        ),
                                        TextSpan(
                                          text: " /Points",
                                          style: TTextStyles.h6.copyWith(
                                            color: TColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                ProfitProgressBar(
                                  profit: state.gainedPoints,
                                  referenceProfit: state.referancePoints,
                                ),
                                Space(height: 12.h),
                              ],
                            ),
                          ),
                          const Space(),

                          // 2) "Your Referances & Code"
                          InkWell(
                            onTap: () {
                              context.push('/referance');
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16.h, horizontal: 16.w),
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
                              height: 90.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    IconlyLight.addUser,
                                    size: 32.w,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Your Referances & Code",
                                        style: TTextStyles.largeBold,
                                      ),
                                      const Space(),
                                      Icon(
                                        FontAwesomeIcons.angleRight,
                                        size: 16.w,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Space(),

                          InkWell(
                            onTap: () {
                              context.push('/howtoconvert');
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16.h, horizontal: 16.w),
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
                              height: 90.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.question,
                                    size: 32.w,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "How do I convert my points?",
                                        style: TTextStyles.largeBold,
                                        maxLines: 2,
                                      ),
                                      const Space(),
                                      Icon(
                                        FontAwesomeIcons.angleRight,
                                        size: 16.w,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Space(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Kendi puanlarınız (profit) ve referans puanlarınız (referenceProfit)
/// arasındaki dağılımı gösteren basit bir progress bar örneği.
class ProfitProgressBar extends StatelessWidget {
  final int profit;
  final int referenceProfit;

  const ProfitProgressBar({
    super.key,
    required this.profit,
    required this.referenceProfit,
  });

  @override
  Widget build(BuildContext context) {
    int total = profit + referenceProfit;
    double profitPercentage = total > 0 ? (profit / total) * 100 : 0;
    double referenceProfitPercentage =
        total > 0 ? (referenceProfit / total) * 100 : 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// "Your Points" ve "Reference Points" bilgileri
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Points',
                  style: TTextStyles.largeRegular,
                ),
                Text(
                  '$profit',
                  style: TTextStyles.h5,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Reference Points',
                  style: TTextStyles.largeRegular,
                ),
                Text(
                  '$referenceProfit',
                  style: TTextStyles.h5,
                ),
              ],
            ),
          ],
        ),
        const Space(),

        Row(
          children: [
            profitPercentage == 0 || referenceProfit == 0
                ? Expanded(
                    flex: 100,
                    child: Container(
                        height: 10.0.w,
                        decoration: BoxDecoration(
                          color: TColors.greyBackground,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.r),
                            bottomLeft: Radius.circular(8.r),
                            topRight: Radius.circular(8.r),
                            bottomRight: Radius.circular(8.r),
                          ),
                        )),
                  )
                : Expanded(
                    flex: profitPercentage.toInt(),
                    child: Container(
                      height: 10.0.w,
                      decoration: BoxDecoration(
                        color: TColors.green,
                        borderRadius: profit == 0 || referenceProfit == 0
                            ? BorderRadius.only(
                                topLeft: Radius.circular(8.r),
                                bottomLeft: Radius.circular(8.r),
                                topRight: Radius.circular(8.r),
                                bottomRight: Radius.circular(8.r),
                              )
                            : BorderRadius.only(
                                topLeft: Radius.circular(8.r),
                                bottomLeft: Radius.circular(8.r),
                              ),
                      ),
                    ),
                  ),
            Expanded(
              flex: referenceProfitPercentage.toInt(),
              child: Container(
                height: 10.0.w,
                decoration: BoxDecoration(
                  color: TColors.primary,
                  borderRadius: profit > 0 || referenceProfit == 0
                      ? BorderRadius.only(
                          topRight: Radius.circular(8.r),
                          bottomRight: Radius.circular(8.r),
                        )
                      : BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          bottomLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r),
                          bottomRight: Radius.circular(8.r),
                        ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

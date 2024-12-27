import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waterwin_app/core/constants/assets_constants.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/appbar_widget.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/custom_widgets/top_snackbar.dart';
import 'package:waterwin_app/presentations/referance_page/presentations/bloc/referance_cubit.dart';

class ReferancePage extends StatefulWidget {
  final ReferanceCubit? referanceCubit;

  const ReferancePage({super.key, this.referanceCubit});

  @override
  State<ReferancePage> createState() => _ReferancePageState();
}

class _ReferancePageState extends State<ReferancePage> {
  late final ReferanceCubit _referanceCubit;

  @override
  void initState() {
    _referanceCubit = widget.referanceCubit ?? ReferanceCubit()
      ..getReranceAndCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _referanceCubit,
      child: BlocBuilder<ReferanceCubit, ReferanceState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: TColors.lightBackground,
            appBar: const AppBarWidget(
              title: "Refer a friend",
            ),
            body: SizedBox(
              width: MediaQuery.of(context).size.width, // Ekran genişliği
              height: MediaQuery.of(context).size.height,
              child: FittedBox(
                fit: BoxFit.scaleDown, // İçeriği ekrana sığdırmak için
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                  child: ConstrainedBox(
                    // İçeriğin ne kadar büyüyüp/küçülebileceğini sınırlıyoruz
                    constraints: BoxConstraints(
                      maxWidth: 1.sw, // En fazla tam ekran genişliğinde
                      minWidth: 1.sw, // Minimum da tam ekran genişliğinde
                      maxHeight: 0.8.sh, // En fazla tam ekran yüksekliğinde
                    ),
                    child: TabbarDemo(
                      state: state,
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

class TabbarDemo extends StatelessWidget {
  final ReferanceState state;

  const TabbarDemo({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 16.w,
                  offset: const Offset(0, 4),
                ),
              ],
              color: TColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.zero,
              dividerColor: Colors.transparent,
              indicator: const BoxDecoration(
                color: TColors.primary,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelColor: TColors.white,
              unselectedLabelColor: TColors.black,
              tabs: [
                Tab(
                  height: 50.h,
                  child: Text(
                    "Refer a friend",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Tab(
                  height: 50.h,
                  child: Text(
                    "Your References",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          /// ---- TAB BAR VIEW (İçerik) ----
          /// İki sekmenin içeriğini burada gösteriyoruz.
          SizedBox(height: 16.h),
          Expanded(
            child: TabBarView(
              children: [
                /// 1. Sekme "Refer a friend"
                ReferAFriendWidget(state: state),

                /// 2. Sekme "Your References"
                SingleChildScrollView(
                  child: ReferancesWidget(state: state),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReferAFriendWidget extends StatelessWidget {
  final ReferanceState state;
  const ReferAFriendWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 8.w),
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
          const Space(),
          Text(
            "Refer a friend",
            style: TTextStyles.h5,
          ),
          const Space(),
          Text(
            "You earn points equal to 10% of the earnings of each person you refer.",
            style: TTextStyles.mediumRegular,
          ),
          const Space(),
          Container(
            width: double.infinity,
            height: 80.h,
            decoration: BoxDecoration(
              color: TColors.lightBackground,
              border: Border.all(
                color: TColors.primary,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    flex: 3,
                    child: Text(
                      state.referanceCode,
                      textAlign: TextAlign.center,
                      style: TTextStyles.h3,
                    )),
                Expanded(
                    child: InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: state.referanceCode));
                    showTopSnackBar(context, "Copied to clipboard");
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: TColors.primary,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Center(
                      child: Icon(FontAwesomeIcons.copy,
                          size: 16.sp, color: TColors.white),
                    ),
                  ),
                )),
              ],
            ),
          ),
          const Space(),
          Text(
            "Forward the code to your friends. After registration, you will earn 10% of the earnings of the people who enter your reference code.",
            style: TTextStyles.mediumRegular,
          ),
        ],
      ),
    );
  }
}

class ReferancesWidget extends StatelessWidget {
  final ReferanceState state;
  const ReferancesWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      width: 1.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Referances", style: TTextStyles.h5),
            ],
          ),
          Divider(
            color: TColors.lightBackground,
            thickness: 1.w,
          ),
          state.referances.isEmpty
              ? Center(
                  child: Text("Your Referance List is Empty."),
                )
              : ListView.separated(
                  itemCount: state.referances.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var referance = state.referances[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      child: Row(
                        children: [
                          Text(
                            "${index + 1}.",
                            style: TTextStyles.largeBold,
                          ),
                          Space(),
                          Expanded(
                            flex: 2,
                            child: Text(
                              referance.name ?? "",
                              textAlign: TextAlign.start,
                              style: TTextStyles.xLargeMedium.copyWith(),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "${referance.points} Points",
                              style: TTextStyles.h6.copyWith(
                                color: TColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    color: TColors.lightBackground,
                    thickness: 1.w,
                  ),
                ),
        ],
      ),
    );
  }
}

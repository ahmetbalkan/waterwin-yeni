import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/appbar_widget.dart';
import 'package:waterwin_app/custom_widgets/custom_dialog_widget.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/custom_widgets/top_snackbar.dart';
import 'package:waterwin_app/presentations/account_page/presentations/account_page.dart';
import 'package:waterwin_app/presentations/account_page/presentations/payment_options_page/bloc/profit_cubit.dart';

class PaymentOptionsPage extends StatefulWidget {
  final ProfitCubit? profitCubit;

  const PaymentOptionsPage({super.key, this.profitCubit});

  @override
  State<PaymentOptionsPage> createState() => _PaymentOptionsPageState();
}

class _PaymentOptionsPageState extends State<PaymentOptionsPage> {
  late final ProfitCubit _profitCubit;

  @override
  void initState() {
    super.initState();
    _profitCubit = widget.profitCubit ?? ProfitCubit()
      ..refreshProfitData();
  }

  @override
  void dispose() {
    _profitCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _profitCubit,
      child: BlocConsumer<ProfitCubit, ProfitState>(
        listener: (context, state) {
          if (state.dataStatus == ProfitDataStatus.error) {
            showTopSnackBar(context, state.dataErrorMessage ?? '');
          }
          if (state.paymentRequestStatus == PaymentRequestStatus.success) {
            showTopSnackBar(context, "Payment request sent successfully.");
          }
        },
        builder: (context, state) {
          if (state.dataStatus == ProfitDataStatus.loading) {
            return Scaffold(
              backgroundColor: TColors.lightBackground,
              appBar: const AppBarWidget(
                title: "Payment",
              ),
              body: const Center(child: CircularProgressIndicator()),
            );
          }

          final double gainedPoints = state.profitData?.normalTotal ?? 0.0;
          final double referencePoints =
              state.profitData?.referenceTotal ?? 0.0;
          final double totalPoints = gainedPoints + referencePoints;

          return Scaffold(
            backgroundColor: TColors.lightBackground,
            appBar: const AppBarWidget(
              title: "Payment",
            ),
            body: SafeArea(
              child: Container(
                // DrinkReminderPage’teki gibi tam ekran
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.topCenter,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 1.sw, // Genişlik: ekranın tamamı
                        minWidth: 1.sw,
                        maxHeight: 0.85.sh,
                      ),
                      // İçerik taştığında dikey scroll sağlamak için SingleChildScrollView
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 16.h),
                            _buildEarningsContainer(
                              gainedPoints,
                              referencePoints,
                              totalPoints,
                            ),
                            SizedBox(height: 36.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 16.h),
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
                                  MenuItemWidget(
                                    title: "Receive Payment",
                                    icon: IconlyLight.tickSquare,
                                    onTap: () {
                                      if (totalPoints > 10.0) {
                                        showCustomDialog(
                                          context: context,
                                          icon: const Icon(
                                            Icons.warning,
                                            size: 50.0,
                                            color: TColors.error,
                                          ),
                                          title:
                                              'Your Total Cash : ${totalPoints.toStringAsFixed(3)} \$',
                                          description:
                                              'If you confirm this, your entire balance will be transferred to your account. Do you want to continue?',
                                          confirmButtonText: 'Confirm',
                                          cancelButtonText: 'Close',
                                          onConfirm: () {
                                            context
                                                .read<ProfitCubit>()
                                                .requestPayment();
                                            context.pop();
                                          },
                                          onCancel: () {
                                            context.pop();
                                          },
                                        );
                                      } else {
                                        showCustomDialog(
                                          context: context,
                                          icon: Icon(
                                            IconlyLight.dangerCircle,
                                            size: 56.sp,
                                            color: TColors.error,
                                          ),
                                          title: "Insufficient funds.",
                                          description:
                                              "The balance you want to withdraw is less than 10 dollars. You can only create a withdrawal for balances over \$10.",
                                          confirmButtonText: "OK",
                                          cancelButtonText: "Cancel",
                                          onConfirm: () => context.pop(),
                                          onCancel: () => context.pop(),
                                        );
                                      }
                                    },
                                  ),
                                  Divider(
                                    color: TColors.greyBackground,
                                    height: 1.w,
                                  ),
                                  MenuItemWidget(
                                    title: "My Payment Requests",
                                    icon: IconlyLight.paperPlus,
                                    onTap: () {
                                      context.push(
                                        '/mypaymentrequests',
                                        extra: _profitCubit,
                                      );
                                    },
                                  ),
                                  Divider(
                                    color: TColors.greyBackground,
                                    height: 1.w,
                                  ),
                                  MenuItemWidget(
                                    title: "Change Wallet ID",
                                    icon: IconlyLight.wallet,
                                    onTap: () {
                                      context.push(
                                        '/change-wallet-id',
                                        extra: _profitCubit,
                                      );
                                    },
                                  ),
                                  Divider(
                                    color: TColors.greyBackground,
                                    height: 1.w,
                                  ),
                                  MenuItemWidget(
                                    title: "Monthly Statistics",
                                    icon: IconlyLight.chart,
                                    onTap: () {
                                      context.push('/paymentstatistic');
                                    },
                                  ),
                                ],
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
            ),
          );
        },
      ),
    );
  }

  /// Üstte kazançlarınızı göstermek için oluşturduğumuz Container
  Widget _buildEarningsContainer(
    double gainedPoints,
    double referencePoints,
    double totalPoints,
  ) {
    return Container(
      padding: EdgeInsets.all(24.w),
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
          // Başlık ve yenileme ikonu
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Current Earnings", style: TTextStyles.h5),
              IconButton(
                onPressed: () {
                  _profitCubit.refreshProfitData();
                },
                icon: Icon(
                  FontAwesomeIcons.arrowRotateLeft,
                  color: TColors.primary,
                  size: 24.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          const Divider(color: TColors.greyBackground),
          SizedBox(height: 4.h),

          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: totalPoints.toStringAsFixed(3),
                    style: TTextStyles.h1,
                  ),
                  TextSpan(
                    text: " \$",
                    style: TTextStyles.h1.copyWith(color: TColors.black),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 4.h),
          const Divider(color: TColors.greyBackground),
          SizedBox(height: 4.h),

          // Aşağıda bar olarak kazanç dağılımı
          ProfitProgressBar(
            profit: gainedPoints,
            referenceProfit: referencePoints,
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }

  /// Tek bir satırda ödeme seçeneği veya işlemi gösteren buton
  Widget _buildPaymentOptionButton(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(24.w),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              size: 32.w,
              color: TColors.black,
            ),
            Row(
              children: [
                Text(
                  title,
                  style: TTextStyles.xLargeMedium,
                ),
                SizedBox(width: 8.w),
                Icon(
                  FontAwesomeIcons.angleRight,
                  size: 16.w,
                  color: TColors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Kazançları görsel olarak temsil eden bar
class ProfitProgressBar extends StatelessWidget {
  final double profit;
  final double referenceProfit;

  const ProfitProgressBar({
    Key? key,
    required this.profit,
    required this.referenceProfit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double total = profit + referenceProfit;
    int totalFlex = 1000;
    int profitFlex = total > 0 ? ((profit / total) * totalFlex).round() : 0;
    int referenceProfitFlex = totalFlex - profitFlex;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Üstte kazanç metinleri
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your Earnings', style: TTextStyles.largeRegular),
                Text('${profit.toStringAsFixed(3)} \$', style: TTextStyles.h5),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Reference Earnings', style: TTextStyles.largeRegular),
                Text('${referenceProfit.toStringAsFixed(3)} \$',
                    style: TTextStyles.h5),
              ],
            ),
          ],
        ),
        SizedBox(height: 8.h),
        // Altta progress bar
        Row(
          children: [
            profitFlex == 0 && referenceProfitFlex == 0
                ? Expanded(
                    child: Container(
                      height: 10.w,
                      decoration: BoxDecoration(
                        color: TColors.greyBackground,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  )
                : Expanded(
                    flex: profitFlex,
                    child: Container(
                      height: 10.w,
                      decoration: const BoxDecoration(
                        color: TColors.green,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          bottomLeft: Radius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
            Expanded(
              flex: referenceProfitFlex,
              child: Container(
                height: 10.w,
                decoration: const BoxDecoration(
                  color: TColors.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:waterwin_app/core/extentions/datetime_extentions.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/appbar_widget.dart';
import 'package:waterwin_app/custom_widgets/custom_dialog_widget.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/custom_widgets/top_snackbar.dart';
import 'package:waterwin_app/presentations/account_page/presentations/payment_options_page/bloc/profit_cubit.dart';

class MyPaymentRequestPage extends StatefulWidget {
  final ProfitCubit? profitCubit;
  const MyPaymentRequestPage({super.key, this.profitCubit});

  @override
  State<MyPaymentRequestPage> createState() => _MyPaymentRequestPageState();
}

class _MyPaymentRequestPageState extends State<MyPaymentRequestPage> {
  late final ProfitCubit _profitCubit;

  @override
  void initState() {
    super.initState();
    _profitCubit = widget.profitCubit ?? ProfitCubit()
      ..fetchPaymentRequests();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.profitCubit ?? _profitCubit,
      child: BlocBuilder<ProfitCubit, ProfitState>(
        builder: (context, state) {
          if (state.paymentRequestStatus == PaymentRequestStatus.loading) {
            return const Scaffold(
              appBar: AppBarWidget(title: "Payment Requests"),
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final paymentRequests = (state.paymentRequests ?? []);

          return BlocListener<ProfitCubit, ProfitState>(
            listener: (context, state) {
              if (state.paymentRequestStatus == PaymentRequestStatus.error) {
                showTopSnackBar(
                    context, state.paymentRequestErrorMessage ?? "");
              }
              if (state.paymentRequestStatus == PaymentRequestStatus.success) {
                showTopSnackBar(
                    context, "Your payment request has been canceled.");
              }
            },
            child: Scaffold(
              appBar: const AppBarWidget(title: "Payment Requests"),
              body: SizedBox(
                width: MediaQuery.of(context).size.width, // Ekran genişliği
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                    child: ConstrainedBox(
                      // İçeriğin ne kadar büyüyüp/küçülebileceğini sınırlıyoruz
                      constraints: BoxConstraints(
                        maxWidth: 1.sw, // En fazla tam ekran genişliğinde
                        minWidth: 1.sw, // Minimum da tam ekran genişliğinde
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 24.h),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Your Payment Requests",
                                      style: TTextStyles.h5,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        context
                                            .read<ProfitCubit>()
                                            .fetchPaymentRequests();
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
                                paymentRequests.isNotEmpty
                                    ? ListView.separated(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: paymentRequests.length,
                                        itemBuilder: (context, index) {
                                          final request =
                                              paymentRequests[index];

                                          // Durum Gösterimi
                                          String statusText;
                                          Color statusColor;
                                          switch (request.requestTypeId) {
                                            case 1:
                                              statusText = "Paid";
                                              statusColor = Colors.orange;
                                              break;
                                            case 2:
                                              statusText = "Unpaid";
                                              statusColor = Colors.purple;
                                              break;
                                            case 3:
                                              statusText = "Pending";
                                              statusColor = Colors.orange;
                                              break;
                                            case 4:
                                              statusText = "Canceled";
                                              statusColor = Colors.red;
                                              break;
                                            default:
                                              statusText = "Unknown";
                                              statusColor = Colors.black;
                                          }
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8.h),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        statusText,
                                                        style: TTextStyles
                                                            .xLargeMedium
                                                            .copyWith(
                                                          color: statusColor,
                                                        ),
                                                      ),
                                                    ],
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
                                                        "Request ID: ${request.id}",
                                                        style: TTextStyles.h6
                                                            .copyWith(
                                                          color: TColors.black,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Total Amount: ${request.totalAmount} \$",
                                                        style: TTextStyles.h6
                                                            .copyWith(
                                                          color: TColors.black,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Created: ${request.createdAt?.toFormattedDateTime()}",
                                                        style: TTextStyles
                                                            .smallRegular
                                                            .copyWith(
                                                          color:
                                                              TColors.textGrey,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Pay Date: ${request.payDate != null && request.status == 1 ? request.payDate.toFormattedDateTime() : "Waiting"}",
                                                        style: TTextStyles
                                                            .smallRegular
                                                            .copyWith(
                                                          color:
                                                              TColors.textGrey,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Note: ${request.note}",
                                                        style: TTextStyles
                                                            .smallRegular
                                                            .copyWith(
                                                          color:
                                                              TColors.textGrey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      request.requestTypeId == 3
                                                          ? Column(
                                                              children: [
                                                                IconButton(
                                                                  icon: Icon(
                                                                    Icons
                                                                        .cancel,
                                                                    color: Colors
                                                                        .red,
                                                                    size: 32.w,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    showCustomDialog(
                                                                      context:
                                                                          context,
                                                                      icon:
                                                                          Icon(
                                                                        FontAwesomeIcons
                                                                            .question,
                                                                        size: 50
                                                                            .w,
                                                                      ),
                                                                      title:
                                                                          "Your request is being canceled.",
                                                                      description:
                                                                          "Are you sure you want to do this?",
                                                                      confirmButtonText:
                                                                          "Confirm",
                                                                      cancelButtonText:
                                                                          "Cancel",
                                                                      onConfirm:
                                                                          () {
                                                                        context
                                                                            .read<ProfitCubit>()
                                                                            .cancelPaymentRequest(request.id!);
                                                                        context
                                                                            .pop();
                                                                      },
                                                                      onCancel: () =>
                                                                          context
                                                                              .pop(),
                                                                    );
                                                                  },
                                                                ),
                                                                Text(
                                                                  "Cancel",
                                                                  style: TTextStyles
                                                                      .smallRegular
                                                                      .copyWith(
                                                                    color: TColors
                                                                        .error,
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          : const SizedBox
                                                              .shrink(),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) =>
                                            Divider(
                                          color: TColors.greyBackground,
                                          thickness: 1.w,
                                        ),
                                      )
                                    : Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16.h),
                                          child: Text(
                                            "No payment requests available.",
                                            style: TTextStyles.largeRegular,
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

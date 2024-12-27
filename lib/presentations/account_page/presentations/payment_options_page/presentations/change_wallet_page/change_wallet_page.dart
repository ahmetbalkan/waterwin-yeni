import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterwin_app/core/constants/validations/validation.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/sizes.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/appbar_widget.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/custom_widgets/top_snackbar.dart';
import 'package:waterwin_app/presentations/account_page/presentations/payment_options_page/presentations/change_wallet_page/bloc/wallet_cubit.dart';
import 'package:waterwin_app/presentations/account_page/presentations/payment_options_page/presentations/change_wallet_page/change_wallet_id_dialog.dart';

class ChangeWalletIdPage extends StatefulWidget {
  final WalletCubit? profitCubit;
  const ChangeWalletIdPage({super.key, this.profitCubit});

  @override
  ChangeWalletIdPageState createState() => ChangeWalletIdPageState();
}

class ChangeWalletIdPageState extends State<ChangeWalletIdPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _walletIdController;
  late final WalletCubit _walletCubit;

  @override
  void initState() {
    _walletCubit = widget.profitCubit ?? WalletCubit()
      ..fetchPaymentInformation();

    _walletIdController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _walletIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _walletCubit,
      child: BlocBuilder<WalletCubit, WalletState>(
        builder: (context, state) {
          return BlocListener<WalletCubit, WalletState>(
            listener: (context, state) {
              // Success durumunda ve dialog henüz açılmadıysa dialog'u göster
              if (state.walletRequestStatus == WalletRequestStatus.success &&
                  state.walletRequestConfirmationStatus ==
                      WalletConfirmationStatus.initial) {
                showChangeWalletDialog(
                  context: context,
                  walletCubit: context.read<WalletCubit>(),
                  walletAddress: _walletIdController.text,
                );
              } else if (state.walletRequestStatus ==
                  WalletRequestStatus.error) {
                // Hata durumunda sadece hata mesajı göster
                showTopSnackBar(
                  context,
                  state.walletErrorMessage ??
                      "Error occurred while requesting wallet change.",
                );
              }

              // Confirmation başarıyla tamamlandığında dialog'u kapat
              if (state.walletRequestConfirmationStatus ==
                  WalletConfirmationStatus.success) {
                if (context.canPop()) {
                  context.pop();
                }
                showTopSnackBar(context, "Wallet successfully updated!");
              } else if (state.walletRequestConfirmationStatus ==
                  WalletConfirmationStatus.error) {
                showTopSnackBar(
                  context,
                  state.walletConfirmationErrorMessage ??
                      "Error occurred while confirming wallet change.",
                );
              }

              if (state.paymentInformationStatus ==
                  PaymentInformationStatus.loaded) {
                _walletIdController.text =
                    state.paymentInformation?.walletId ?? "";
              }
            },
            child: Scaffold(
              backgroundColor: TColors.white,
              appBar: const AppBarWidget(title: "Change Wallet ID"),
              body: state.paymentInformationStatus ==
                      PaymentInformationStatus.loading
                  ? const Center(child: CircularProgressIndicator())
                  : Container(
                      alignment: Alignment.topCenter,
                      width:
                          MediaQuery.of(context).size.width, // Ekran genişliği
                      height: MediaQuery.of(context)
                          .size
                          .height, // Ekran yüksekliği
                      child: FittedBox(
                        fit: BoxFit.scaleDown, // İçeriği ekrana sığdırmak için
                        alignment: Alignment.center,

                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 24.h),
                          child: ConstrainedBox(
                            // İçeriğin ne kadar büyüyüp/küçülebileceğini sınırlıyoruz
                            constraints: BoxConstraints(
                              maxWidth: 1.sw,
                              minWidth: 0.8.sw,
                              maxHeight: 0.8.sh,
                            ),
                            child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "What is your wallet ID?",
                                      style: TTextStyles.h3,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                    ),
                                    Space(height: 8.h),
                                    Text(
                                      "Please enter your wallet ID correctly so that we can send your earnings to the right place.",
                                      textAlign: TextAlign.start,
                                      maxLines: 3,
                                      style: TTextStyles.xLargeRegular,
                                    ),
                                    Space(height: 24.h),
                                    TextFormField(
                                      controller: _walletIdController,
                                      decoration: InputDecoration(
                                        prefix: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12.w),
                                          child: Icon(IconlyLight.wallet,
                                              size: 24.sp),
                                        ),
                                        hintText:
                                            state.isWalletChangeRequest == true
                                                ? "Enter your wallet ID"
                                                : "Please enter your wallet ID",
                                      ),
                                      readOnly: state.isWalletChangeRequest,
                                      style: TTextStyles.largeBold,
                                      validator: (value) =>
                                          TValidator.validateName(value),
                                    ),
                                    Space(height: 24.h),
                                    state.isWalletChangeRequest == true
                                        ? CustomButton(
                                            onTap: () {
                                              if (state.isWalletChangeRequest ==
                                                  true) {
                                                _walletIdController.text = "";
                                              } else {
                                                _walletIdController.text = state
                                                        .paymentInformation
                                                        ?.walletId ??
                                                    "";
                                              }

                                              context
                                                  .read<WalletCubit>()
                                                  .changeWalletTextfieldStatus();
                                            },
                                            padding: 0,
                                            textStyle:
                                                TTextStyles.mediumBold.copyWith(
                                              color: TColors.white,
                                            ),
                                            backgroundColor: TColors.primary,
                                            text: 'Change Wallet ID',
                                          )
                                        : CustomButton(
                                            onTap: () {
                                              state.walletRequestStatus ==
                                                      WalletRequestStatus
                                                          .loading
                                                  ? null // Butonu devre dışı bırak
                                                  : () {
                                                      if (_formKey.currentState!
                                                          .validate()) {
                                                        _walletCubit
                                                            .walletChangeRequest(
                                                          _walletIdController
                                                              .text,
                                                        );
                                                      }
                                                    };
                                            },
                                            padding: 0,
                                            textStyle: TTextStyles.mediumBold
                                                .copyWith(color: TColors.white),
                                            backgroundColor: TColors.primary,
                                            text: 'Save Wallet ID',
                                          )
                                  ],
                                )),
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

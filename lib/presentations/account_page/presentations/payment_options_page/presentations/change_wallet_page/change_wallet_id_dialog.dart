import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinput/pinput.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/custom_widgets/top_snackbar.dart';
import 'package:waterwin_app/presentations/account_page/presentations/payment_options_page/presentations/change_wallet_page/bloc/wallet_cubit.dart';

Future<void> showChangeWalletDialog({
  required BuildContext context,
  required WalletCubit walletCubit,
  required String walletAddress,
}) async {
  final TextEditingController pinController = TextEditingController();
  String? tokenCode;

  final defaultPinTheme = PinTheme(
    width: 60.w,
    height: 60.w,
    textStyle: TTextStyles.xLargeSemibold.copyWith(
      color: TColors.black,
      fontSize: 24.sp,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: TColors.greyBackground),
      borderRadius: BorderRadius.circular(12.r),
      color: TColors.greyBackground,
    ),
  );

  final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: TColors.primary),
    borderRadius: BorderRadius.circular(12.r),
  );

  final submittedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration?.copyWith(
      color: TColors.greyBackground,
    ),
  );

  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return BlocProvider.value(
        value: walletCubit,
        child: BlocBuilder<WalletCubit, WalletState>(
          builder: (context, state) {
            final isLoading = state.walletRequestConfirmationStatus ==
                WalletConfirmationStatus.loading;

            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header
                  Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: TColors.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        topRight: Radius.circular(16.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "Confirmation Code",
                              style: TTextStyles.largeBold.copyWith(
                                color: TColors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            onPressed: isLoading
                                ? null
                                : () {
                                    if (Navigator.of(context,
                                            rootNavigator: true)
                                        .canPop()) {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                    }
                                  },
                            icon: Icon(
                              FontAwesomeIcons.circleXmark,
                              color: TColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Content
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: TColors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16.r),
                        bottomRight: Radius.circular(16.r),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Space(),
                        Icon(
                          FontAwesomeIcons.key,
                          color: TColors.primary,
                          size: 48.w,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 16.h),
                          child: Column(
                            children: [
                              Space(height: 4.h),
                              Text(
                                "Confirmation Code",
                                style: TTextStyles.h5,
                                textAlign: TextAlign.center,
                              ),
                              Space(height: 16.h),
                              Text(
                                "Please enter the code sent to your email to confirm the wallet ID change.",
                                style: TTextStyles.largeRegular,
                                textAlign: TextAlign.center,
                              ),
                              const Space(),
                              Container(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 8.h),
                                  child: Pinput(
                                    controller: pinController,
                                    defaultPinTheme: defaultPinTheme,
                                    focusedPinTheme: focusedPinTheme,
                                    submittedPinTheme: submittedPinTheme,
                                    validator: (s) {
                                      if (s == null || s.length != 4) {
                                        return 'Please enter a 4-digit PIN';
                                      }
                                      return null;
                                    },
                                    pinputAutovalidateMode:
                                        PinputAutovalidateMode.onSubmit,
                                    showCursor: true,
                                    keyboardType: TextInputType.number,
                                    onCompleted: (pin) => tokenCode = pin,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Space(),
                  // Actions
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16.r),
                          ),
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: TColors.white,
                                )
                              : CustomButton(
                                  onTap: isLoading
                                      ? null
                                      : () {
                                          if (tokenCode != null &&
                                              tokenCode!.length == 4) {
                                            walletCubit.confirmWalletChange(
                                                tokenCode!, walletAddress);
                                          } else {
                                            showTopSnackBar(context,
                                                "Enter a valid 4-digit OTP.");
                                          }
                                        },
                                  padding: 0,
                                  textStyle: TTextStyles.mediumBold,
                                  backgroundColor: TColors.primary,
                                  text: "Confirm",
                                ),
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16.r),
                          ),
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: TColors.white,
                                )
                              : CustomButton(
                                  onTap: isLoading
                                      ? null
                                      : () {
                                          if (Navigator.of(context,
                                                  rootNavigator: true)
                                              .canPop()) {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop();
                                          }
                                        },
                                  padding: 0,
                                  textStyle: TTextStyles.mediumBold,
                                  backgroundColor: TColors.primary,
                                  text: "Confirm",
                                ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/sizes.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/blur_fullpage_loading.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';
import 'package:waterwin_app/custom_widgets/top_snackbar.dart';
import 'package:waterwin_app/presentations/authentications_page/forgot_password_pages/bloc/forgotpassword_cubit.dart';

class OtpCodePage extends StatefulWidget {
  final ForgotPasswordCubit? forgotPasswordCubit;
  const OtpCodePage({super.key, this.forgotPasswordCubit});

  @override
  State<OtpCodePage> createState() => _OtpCodePageState();
}

class _OtpCodePageState extends State<OtpCodePage> {
  late GlobalKey<FormState> _form;
  late TextEditingController pinController;
  late final ForgotPasswordCubit _forgotPasswordCubit;
  late var defaultPinTheme;
  late var focusedPinTheme;
  late var submittedPinTheme;
  late var errorPinTheme;
  bool hasNavigated = false; // Navigasyon flagi

  @override
  void initState() {
    _form = GlobalKey<FormState>();
    pinController = TextEditingController();
    _forgotPasswordCubit = widget.forgotPasswordCubit ?? ForgotPasswordCubit()
      ..startCountdown();
    defaultPinTheme = PinTheme(
      width: 80.w,
      height: 80.w,
      textStyle: TTextStyles.largeRegular.copyWith(
        color: TColors.black,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );
    errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration.copyWith(
        border: Border.all(color: TColors.error),
      ),
    );

    focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(20),
    );

    submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration.copyWith(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _forgotPasswordCubit,
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state.status == ForgotPasswordStatus.tokenValidated) {
            context.push(
              "/fpchangepassword",
              extra: {"email": state.email, "token": pinController.text},
            );
          } else if (state.status == ForgotPasswordStatus.error) {
            showTopSnackBar(context, state.errorMessage);
          }

          if (state.otpResendStatus == OtpResendStatus.error) {
            showTopSnackBar(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Scaffold(
                appBar: AppBar(),
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: TSizes.pagePaddingHorizontal),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 1.sw,
                            minWidth: 0.8.sw,
                          ),
                          child: Form(
                            key: _form,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 8.h),
                                Text("Enter OTP Code 🔐",
                                    style: TTextStyles.h3),
                                SizedBox(height: 12.h),
                                Text(
                                  "We've sent an OTP code to your email. Please check your inbox and enter the code below.",
                                  style: TTextStyles.xLargeRegular,
                                ),
                                SizedBox(height: 32.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Pinput(
                                        controller: pinController,
                                        defaultPinTheme: defaultPinTheme,
                                        focusedPinTheme: focusedPinTheme,
                                        submittedPinTheme: submittedPinTheme,
                                        errorPinTheme: errorPinTheme,
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
                                        focusNode: FocusNode(),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 32.h),
                                Center(
                                  child: state.isResendButtonActive
                                      ? Text(
                                          "Ready to send it again. Click here.",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall)
                                      : RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            text: 'You can resend the code in ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                            children: [
                                              TextSpan(
                                                text:
                                                    state.timerValue.toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall
                                                    ?.copyWith(
                                                        color: TColors.primary),
                                              ),
                                              TextSpan(
                                                text: ' seconds.',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                ),
                                SizedBox(height: 16.h),
                                CustomButton(
                                  onTap: state.isResendButtonActive
                                      ? () {
                                          _forgotPasswordCubit
                                              .reSendForgotPassword();
                                        }
                                      : null,
                                  padding: 16.w,
                                  borderColor: state.isResendButtonActive
                                      ? Colors.transparent
                                      : TColors.primary,
                                  backgroundColor: state.isResendButtonActive
                                      ? TColors.primary
                                      : TColors.white,
                                  text: "Resend code",
                                  textStyle: TTextStyles.largeBold.copyWith(
                                    color: state.isResendButtonActive
                                        ? TColors.white
                                        : TColors.primary,
                                  ),
                                ),
                                SizedBox(height: 32.h),
                                CustomButton(
                                  onTap: () {
                                    if (_form.currentState!.validate()) {
                                      _forgotPasswordCubit.validateResetToken(
                                        state.email,
                                        pinController.text,
                                      );
                                    }
                                  },
                                  padding: 16.w,
                                  backgroundColor: TColors.primary,
                                  text: "Confirm Code",
                                  textStyle: TTextStyles.largeBold
                                      .copyWith(color: TColors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (state.status == ForgotPasswordStatus.loading)
                const BlurFullPageLoadingWidget(
                  loadingtext: "Validating..",
                )
              else if (state.otpResendStatus == OtpResendStatus.loading)
                const BlurFullPageLoadingWidget(
                  loadingtext: "Sending..",
                )
              else
                const SizedBox.shrink()
            ],
          );
        },
      ),
    );
  }
}

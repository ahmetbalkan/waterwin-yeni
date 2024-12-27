import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterwin_app/core/constants/validations/validation.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/sizes.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/blur_fullpage_loading.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';
import 'package:waterwin_app/custom_widgets/top_snackbar.dart';
import 'package:waterwin_app/presentations/authentications_page/forgot_password_pages/bloc/forgotpassword_cubit.dart';

class ForgotPasswordPage extends StatefulWidget {
  final ForgotPasswordCubit? forgotPasswordCubit;

  const ForgotPasswordPage({super.key, this.forgotPasswordCubit});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late GlobalKey<FormState> _form;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late final ForgotPasswordCubit _forgotPasswordCubit;

  @override
  void initState() {
    _forgotPasswordCubit = widget.forgotPasswordCubit ?? ForgotPasswordCubit();
    _form = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _forgotPasswordCubit,
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state.status == ForgotPasswordStatus.emailSent) {
            context.push("/otpcode", extra: _forgotPasswordCubit);
          } else if (state.status == ForgotPasswordStatus.error) {
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
                                Text("Forgot Your Password? 🔑",
                                    style: TTextStyles.h3),
                                SizedBox(height: 12.h),
                                Text(
                                  "No worries! Enter your registered email below to reset your password.",
                                  style: TTextStyles.xLargeRegular,
                                ),
                                SizedBox(height: 32.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 8.0.h),
                                      child: Text("Your Registered Email",
                                          style: TTextStyles.xLargeSemibold),
                                    ),
                                    TextFormField(
                                      controller: _emailController,
                                      validator: TValidator.validateEmail,
                                      decoration: InputDecoration(
                                        hintText: "Email",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  12.w), // Sadece soldan boşluk
                                          child: Icon(
                                            IconlyBroken.message,
                                            color: TColors.primary,
                                            size: 20.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 32.h),
                                CustomButton(
                                  onTap: () {
                                    if (_form.currentState!.validate()) {
                                      _forgotPasswordCubit.forgotPassword(
                                        _emailController.text,
                                      );
                                    }
                                  },
                                  padding: 16.w,
                                  backgroundColor: TColors.primary,
                                  text: "Sign up",
                                  textStyle: TTextStyles.largeBold
                                      .copyWith(color: TColors.white),
                                ),
                                SizedBox(height: 32.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              state.status == ForgotPasswordStatus.loading
                  ? const BlurFullPageLoadingWidget(
                      loadingtext: "Sending..",
                    )
                  : const SizedBox.shrink()
            ],
          );
        },
      ),
    );
  }
}

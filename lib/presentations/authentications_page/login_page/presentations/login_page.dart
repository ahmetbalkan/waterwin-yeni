import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:waterwin_app/core/constants/assets_constants.dart';
import 'package:waterwin_app/core/constants/validations/validation.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/sizes.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/blur_fullpage_loading.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';
import 'package:waterwin_app/custom_widgets/top_snackbar.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/presentations/bloc/login_cubit.dart';

class LoginPage extends StatefulWidget {
  final LoginCubit? loginCubit;
  const LoginPage({super.key, this.loginCubit});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late GlobalKey<FormState> _form;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late final LoginCubit _loginCubit;

  @override
  void initState() {
    _loginCubit = widget.loginCubit ?? LoginCubit();
    _form = GlobalKey<FormState>();
    _emailController = TextEditingController(text: "ahmetrbalkan@gmail.com");
    _passwordController = TextEditingController(text: "raa011797");
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
      value: _loginCubit,
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.loaded) {
            context.go("/homepage");
          } else if (state.status == LoginStatus.gotoinformation) {
            context.go("/information");
          } else if (state.status == LoginStatus.error) {
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
                                Text("Welcome Back! 👋", style: TTextStyles.h3),
                                SizedBox(height: 12.h),
                                Text(
                                  "Sign in to your account to continue your journey towards a healthier you.",
                                  style: TTextStyles.xLargeRegular,
                                ),
                                SizedBox(height: 32.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 8.0.h),
                                      child: Text("Email",
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
                                SizedBox(height: 16.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 8.0.h),
                                      child: Text("Password",
                                          style: TTextStyles.xLargeSemibold),
                                    ),
                                    TextFormField(
                                      controller: _passwordController,
                                      obscureText: state.isObscure,
                                      validator: TValidator.validatePassword,
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  12.w), // Sol ve sağdan boşluk
                                          child: Icon(
                                            IconlyBroken.lock,
                                            color: TColors.primary,
                                            size: 20.sp,
                                          ),
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            _loginCubit
                                                .togglePasswordVisibility();
                                          },
                                          icon: Icon(
                                            state.isObscure
                                                ? IconlyBroken.show
                                                : IconlyBroken.hide,
                                            size: 20.sp,
                                            color: TColors.primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 24.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: CustomButton(
                                          isCompact: true,
                                          onTap: () =>
                                              context.push('/forgotpassword'),
                                          padding: 4.w,
                                          backgroundColor: Colors.transparent,
                                          text: "Forgot Password?",
                                          textStyle: TTextStyles.largeBold
                                              .copyWith(color: TColors.primary),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16.h),
                                CustomButton(
                                  onTap: () {
                                    if (_form.currentState!.validate()) {
                                      _loginCubit.getLogin(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      );
                                    }
                                  },
                                  padding: 16.w,
                                  backgroundColor: TColors.primary,
                                  text: "Sign in",
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
              state.status == LoginStatus.loading
                  ? const BlurFullPageLoadingWidget(
                      loadingtext: "Sign in..",
                    )
                  : const SizedBox.shrink()
            ],
          );
        },
      ),
    );
  }
}

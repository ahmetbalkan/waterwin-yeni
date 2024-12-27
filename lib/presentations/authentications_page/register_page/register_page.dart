import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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
import 'package:waterwin_app/presentations/authentications_page/register_page/bloc/register_cubit.dart';

class RegisterPage extends StatefulWidget {
  final RegisterCubit? registerCubit;

  const RegisterPage({super.key, this.registerCubit});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late GlobalKey<FormState> _form;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late final RegisterCubit _registerCubit;

  @override
  void initState() {
    _form = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _registerCubit = widget.registerCubit ?? RegisterCubit();

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
      value: _registerCubit,
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state.status == RegisterStatus.registered) {
            context.go("/information");
          } else if (state.status == RegisterStatus.error) {
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
                                Text("Join WaterWin Today ✨",
                                    style: TTextStyles.h3),
                                SizedBox(height: 12.h),
                                Text(
                                  "Create an account to track your water intake, set reminders, and unlock achievements.",
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
                                      validator: TValidator.validatePassword,
                                      obscureText: state.isObscure,
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
                                            _registerCubit
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

                                SizedBox(height: 16.h),
                                // Checkbox ve Şartlar
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.5.sp,
                                      child: CupertinoCheckbox(
                                        checkColor: TColors.white,
                                        tristate: true,
                                        value: state.termConfirm,
                                        onChanged: (bool? value) {
                                          context
                                              .read<RegisterCubit>()
                                              .toggleTermConfirm();
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Flexible(
                                      child: RichText(
                                        text: TextSpan(
                                          text: "I agree to WaterWin ",
                                          style: TTextStyles.xLargeRegular,
                                          children: [
                                            TextSpan(
                                              text: "Terms & Conditions.",
                                              style: TTextStyles.xLargeSemibold
                                                  .copyWith(
                                                      color: TColors.primary),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  print(
                                                      "Terms & Conditions clicked!");
                                                },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 32.h),
                                // Sign In Link
                                Center(
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Already have an account? ",
                                      style: TTextStyles.xLargeRegular,
                                      children: [
                                        TextSpan(
                                          text: "Sign in",
                                          style: TTextStyles.xLargeSemibold
                                              .copyWith(color: TColors.primary),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              context.go("/login");
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 32.h),
                                CustomButton(
                                  onTap: () {
                                    if (_form.currentState!.validate()) {
                                      if (state.termConfirm) {
                                        _registerCubit.register(
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                        );
                                      } else {
                                        showTopSnackBar(context,
                                            "Please accept the terms & conditions.");
                                      }
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
              state.status == RegisterStatus.loading
                  ? const BlurFullPageLoadingWidget(
                      loadingtext: "Sign up..",
                    )
                  : const SizedBox.shrink()
            ],
          );
        },
      ),
    );
  }
}

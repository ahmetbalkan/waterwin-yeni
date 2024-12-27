import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterwin_app/core/constants/validations/validation.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/appbar_widget.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/custom_widgets/top_snackbar.dart';
import 'package:waterwin_app/presentations/account_page/presentations/account_and_security_page/bloc/change_password_cubit.dart';

class AccountAndSecurityPage extends StatefulWidget {
  final ChangePasswordCubit? changePasswordCubit;

  const AccountAndSecurityPage({super.key, this.changePasswordCubit});

  @override
  State<AccountAndSecurityPage> createState() => _AccountAndSecurityPageState();
}

class _AccountAndSecurityPageState extends State<AccountAndSecurityPage> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController olpasswordController;
  late TextEditingController passwordController;
  late TextEditingController repasswordController;
  late final ChangePasswordCubit _changePasswordCubit;

  @override
  void initState() {
    olpasswordController = TextEditingController();
    passwordController = TextEditingController();
    repasswordController = TextEditingController();
    _changePasswordCubit = widget.changePasswordCubit ?? ChangePasswordCubit();

    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    olpasswordController.dispose();
    passwordController.dispose();
    repasswordController.dispose();
    _changePasswordCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider.value(
        value: _changePasswordCubit,
        child: BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
          builder: (context, state) {
            return BlocListener<ChangePasswordCubit, ChangePasswordState>(
              listener: (context, state) {
                if (state.status == ChangePasswordStatus.success) {
                  showTopSnackBar(context, "Password changed successfully");
                  context.go("/account");
                } else if (state.status == ChangePasswordStatus.error) {
                  showTopSnackBar(context, state.errorMessage);
                }
              },
              child: Scaffold(
                appBar: const AppBarWidget(title: "Change Password"),
                backgroundColor: Colors.white,
                resizeToAvoidBottomInset: true,
                body: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Container(
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
                              maxWidth: 1.sw, // En fazla tam ekran genişliğinde
                              minWidth:
                                  1.sw, // Minimum da tam ekran genişliğinde
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Space(height: 8.h),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Secure Your Account 🔒",
                                                style: TTextStyles.h4,
                                                maxLines: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Space(
                                          height: 8.h,
                                        ),
                                        Text(
                                          "Choose a new password for your WaterWin account. Make sure it's strong and memorable.",
                                          maxLines: 2,
                                          style: TTextStyles.mediumRegular,
                                        ),
                                      ],
                                    ),
                                    Space(
                                      height: 32.h,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "OldPassword",
                                          maxLines: 1,
                                          textAlign: TextAlign.start,
                                          style: TTextStyles.mediumBold,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 8.h),
                                          child: TextFormField(
                                            controller: olpasswordController,
                                            decoration: const InputDecoration(
                                              hintText: "Old Password",
                                              prefixIcon:
                                                  Icon(Icons.lock_outline),
                                              suffixIcon: Icon(
                                                Icons.remove_red_eye,
                                              ),
                                            ),
                                            validator: (value) =>
                                                TValidator.validatePassword(
                                                    value),
                                          ),
                                        ),
                                        Space(
                                          height: 16.h,
                                        ),
                                        Text(
                                          "Password",
                                          maxLines: 1,
                                          textAlign: TextAlign.start,
                                          style: TTextStyles.mediumBold,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 8.h),
                                          child: TextFormField(
                                            controller: passwordController,
                                            decoration: const InputDecoration(
                                              hintText: "Password",
                                              prefixIcon:
                                                  Icon(Icons.lock_outline),
                                              suffixIcon: Icon(
                                                Icons.remove_red_eye,
                                              ),
                                            ),
                                            validator: (value) =>
                                                TValidator.validatePassword(
                                                    value),
                                          ),
                                        ),
                                        Space(
                                          height: 16.h,
                                        ),
                                        Text(
                                          "Re-Password",
                                          maxLines: 1,
                                          textAlign: TextAlign.start,
                                          style: TTextStyles.mediumBold,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 8.h),
                                          child: TextFormField(
                                            controller: repasswordController,
                                            decoration: const InputDecoration(
                                              hintText: "Re-Password",
                                              prefixIcon:
                                                  Icon(Icons.lock_outline),
                                              suffixIcon: Icon(
                                                Icons.remove_red_eye,
                                              ),
                                            ),
                                            validator: (value) =>
                                                TValidator.validatePassword(
                                                    value),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Space(
                                  height: 24.h,
                                ),
                                Container(
                                  color: TColors.white,
                                  child: CustomButton(
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        _changePasswordCubit.changePassword(
                                          oldPassword:
                                              olpasswordController.text,
                                          newPassword: passwordController.text,
                                          newPasswordConfirmation:
                                              repasswordController.text,
                                        );
                                      }
                                    },
                                    padding: 0,
                                    textStyle: TTextStyles.largeBold.copyWith(
                                      color: TColors.white,
                                    ),
                                    backgroundColor: TColors.primary,
                                    text: "Save New Password",
                                  ),
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
            );
          },
        ),
      ),
    );
  }
}

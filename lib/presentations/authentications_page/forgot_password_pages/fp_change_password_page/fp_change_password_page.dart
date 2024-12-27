import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/sizes.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';

class FpChangePasswordPage extends StatefulWidget {
  const FpChangePasswordPage({super.key});

  @override
  State<FpChangePasswordPage> createState() => _FpChangePasswordPageState();
}

class _FpChangePasswordPageState extends State<FpChangePasswordPage> {
  late GlobalKey<FormState> _form;
  late TextEditingController _passwordController;
  late TextEditingController _repasswordController;

  @override
  void initState() {
    _form = GlobalKey<FormState>();
    _passwordController = TextEditingController();
    _repasswordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _repasswordController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Text("Secure Your Account 🔒", style: TTextStyles.h3),
                      SizedBox(height: 12.h),
                      Text(
                        "Choose a new password for your Hydrify account. Make sure it's strong and memorable.",
                        style: TTextStyles.xLargeRegular,
                      ),
                      SizedBox(height: 32.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0.h),
                            child: Text("New Password",
                                style: TTextStyles.xLargeSemibold),
                          ),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: "New Password",
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w), // Sadece soldan boşluk
                                child: Icon(
                                  IconlyBroken.message,
                                  color: TColors.primary,
                                  size: 20.sp,
                                ),
                              ),
                              suffixIcon: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w), // Sol ve sağdan boşluk
                                child: Icon(
                                  IconlyBroken.hide,
                                  size: 20.sp,
                                  color: TColors.primary,
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
                            child: Text("Confirm New Password",
                                style: TTextStyles.xLargeSemibold),
                          ),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: "Confirm New Password",
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w), // Sol ve sağdan boşluk
                                child: Icon(
                                  IconlyBroken.lock,
                                  color: TColors.primary,
                                  size: 20.sp,
                                ),
                              ),
                              suffixIcon: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w), // Sol ve sağdan boşluk
                                child: Icon(
                                  IconlyBroken.hide,
                                  size: 20.sp,
                                  color: TColors.primary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      CustomButton(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          context.push('/fpchangecompletepage');
                        },
                        padding: 16.w,
                        backgroundColor: TColors.primary,
                        text: "Change Password",
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/appbar_widget.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/presentations/bloc/login_cubit.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.lightBackground,
      appBar: const AppBarWidget(
        title: "Accounts",
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          width: MediaQuery.of(context).size.width, // Ekran genişliği
          height: MediaQuery.of(context).size.height, // Ekran yüksekliği
          child: FittedBox(
            fit: BoxFit.scaleDown, // İçeriği ekrana sığdırmak için
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
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
                            icon: IconlyLight.profile,
                            title: "Personal Info",
                            onTap: () {
                              context.push(
                                '/personalinfo',
                              );
                            },
                          ),
                          Divider(color: TColors.greyBackground, height: 1.w),
                          MenuItemWidget(
                            icon: IconlyLight.notification,
                            title: "Drink Reminder",
                            onTap: () {
                              context.push('/drinkreminder');
                            },
                          ),
                        ],
                      ),
                    ),
                    const Space(),
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
                            icon: IconlyLight.wallet,
                            title: "Payment Options",
                            onTap: () {
                              context.push('/paymentoptions');
                            },
                          ),
                          Divider(
                            color: TColors.greyBackground,
                            height: 1.w,
                          ),
                          MenuItemWidget(
                            icon: IconlyLight.notification,
                            title: "Account & Security",
                            onTap: () {
                              context.push('/accountandsecurity');
                            },
                          ),
                          Divider(
                            color: TColors.greyBackground,
                            height: 1.w,
                          ),
                          MenuItemWidget(
                            icon: IconlyLight.chat,
                            title: "Help & Support",
                            onTap: () {
                              context.push('/helpandsupport');
                            },
                          ),
                          Divider(
                            color: TColors.greyBackground,
                            height: 1.w,
                          ),
                          MenuItemWidget(
                            icon: IconlyLight.chat,
                            title: "Admin",
                            onTap: () {
                              context.push('/admin');
                            },
                          ),
                        ],
                      ),
                    ),
                    const Space(),
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
                            icon: IconlyLight.logout,
                            title: "Logout",
                            color: TColors.error,
                            onTap: () {
                              _settingModalBottomSheet(context);
                            },
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
  }
}

void _settingModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isDismissible: false,
      backgroundColor: TColors.white,
      builder: (BuildContext bc) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
          child: Container(
            width: 1.sw,
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text("Logout",
                          textAlign: TextAlign.center,
                          style: TTextStyles.h4.copyWith(
                            color: TColors.error,
                          )),
                    ),
                  ],
                ),
                Space(height: 8.w),
                const Divider(
                  color: TColors.greyBackground,
                  height: 1,
                ),
                Space(height: 8.w),
                Text(
                  "Are you sure you want to log out?",
                  style: TTextStyles.xLargeMedium,
                ),
                Space(height: 48.w),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        onTap: () {
                          Navigator.of(context).pop(); // context.pop() da olur
                        },
                        padding: 0,
                        textStyle: TTextStyles.mediumBold.copyWith(
                          color: TColors.white,
                        ),
                        backgroundColor: TColors.primary,
                        text: "Cancel",
                      ),
                    ),
                    Space(),
                    Expanded(
                      child: CustomButton(
                        onTap: () {
                          context.read<LoginCubit>().logout();
                        },
                        padding: 0,
                        textStyle: TTextStyles.mediumBold.copyWith(
                          color: TColors.white,
                        ),
                        backgroundColor: TColors.error,
                        text: "Yes, Logout",
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}

class MenuItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? color;
  final Function()? onTap;
  const MenuItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, size: 24.w, color: color ?? TColors.primary),
            Space(width: 24.w),
            Expanded(
              child: Text(
                title,
                style: TTextStyles.h6.copyWith(color: color),
                textAlign: TextAlign.start,
              ),
            ),
            Icon(IconlyLight.arrowRight2,
                size: 24.w, color: color ?? TColors.primary),
          ],
        ),
      ),
    );
  }
}

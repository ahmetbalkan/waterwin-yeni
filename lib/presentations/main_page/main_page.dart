import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/presentations/bloc/login_cubit.dart';

class MainPage extends StatefulWidget {
  final LoginCubit? loginCubit;
  const MainPage({
    super.key,
    required this.navigationShell,
    this.loginCubit,
  });
  final StatefulNavigationShell navigationShell;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void _goBranch(int index) {
    widget.navigationShell.goBranch(index,
        initialLocation: index == widget.navigationShell.currentIndex);
  }

  late final LoginCubit _loginCubit;

  @override
  void initState() {
    super.initState();
    _loginCubit = widget.loginCubit ?? LoginCubit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _loginCubit,
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.logout) {
            context.go("/authwelcome");
          }
        },
        child: SafeArea(
          child: Scaffold(
            body: widget.navigationShell, // Şu anki seçilen sekme içeriği
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: widget.navigationShell.currentIndex,
              iconSize: 24.sp, // İkon boyutu
              type: BottomNavigationBarType.fixed,
              onTap: _goBranch,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: TColors.primary, // Seçili öğe rengi
              unselectedItemColor: TColors.icongrey, // Seçilmeyen öğe rengi
              selectedLabelStyle: TTextStyles.smallBold.copyWith(
                color: TColors.primary,
              ), // Seçili öğe metin stili
              unselectedLabelStyle: TTextStyles.smallRegular.copyWith(
                  color: TColors.primary), // Seçilmeyen öğe metin stili
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(IconlyLight.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(IconlyLight.chart), label: 'Statistics'),
                BottomNavigationBarItem(
                    icon: Icon(IconlyLight.activity), label: 'Points'),
                BottomNavigationBarItem(
                    icon: Icon(IconlyLight.profile), label: 'Account'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

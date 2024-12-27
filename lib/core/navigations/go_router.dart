import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waterwin_app/presentations/account_page/presentations/account_and_security_page/account_and_security_page.dart';
import 'package:waterwin_app/presentations/account_page/presentations/account_page.dart';
import 'package:waterwin_app/presentations/account_page/presentations/admin_page/presentation/admin_page.dart';
import 'package:waterwin_app/presentations/account_page/presentations/drink_reminder_page/presentations/drink_reminder_page.dart';
import 'package:waterwin_app/presentations/account_page/presentations/help_and_support_page/help_and_support_page.dart';
import 'package:waterwin_app/presentations/account_page/presentations/payment_options_page/bloc/profit_cubit.dart';
import 'package:waterwin_app/presentations/account_page/presentations/payment_options_page/presentations/change_wallet_page/change_wallet_page.dart';
import 'package:waterwin_app/presentations/account_page/presentations/payment_options_page/presentations/my_payment_request_page/my_payment_request_page.dart';
import 'package:waterwin_app/presentations/account_page/presentations/payment_options_page/presentations/payment_options_page.dart';
import 'package:waterwin_app/presentations/account_page/presentations/payment_options_page/presentations/profit_list_page/presentations/bloc/profit_list_cubit.dart';
import 'package:waterwin_app/presentations/account_page/presentations/payment_options_page/presentations/profit_list_page/presentations/profit_list_page.dart';
import 'package:waterwin_app/presentations/authentications_page/auth_welcome_page/auth_welcome_page.dart';
import 'package:waterwin_app/presentations/authentications_page/forgot_password_pages/bloc/forgotpassword_cubit.dart';
import 'package:waterwin_app/presentations/authentications_page/forgot_password_pages/forgot_pass_page/forgot_password_page.dart';
import 'package:waterwin_app/presentations/authentications_page/forgot_password_pages/fp_change_password_page/fp_change_password_page.dart';
import 'package:waterwin_app/presentations/authentications_page/forgot_password_pages/fp_complete_page/fp_change_complete_page.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/presentations/login_page.dart';
import 'package:waterwin_app/presentations/authentications_page/forgot_password_pages/otp_code_page/otp_code_page.dart';
import 'package:waterwin_app/presentations/authentications_page/refresh_failed_page/refresh_failed_page.dart';
import 'package:waterwin_app/presentations/authentications_page/register_page/register_page.dart';
import 'package:waterwin_app/presentations/history_page/presentations/history_page.dart';
import 'package:waterwin_app/presentations/home_page/presentations/home_page.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_bloc.dart';
import 'package:waterwin_app/presentations/information_page/presentations/information_page.dart';
import 'package:waterwin_app/presentations/main_page/main_page.dart';
import 'package:waterwin_app/presentations/onboarding_page/onboarding_page.dart';
import 'package:waterwin_app/presentations/account_page/presentations/personal_info_page/presentations/pages/activity_level_page.dart';
import 'package:waterwin_app/presentations/account_page/presentations/personal_info_page/presentations/pages/age_page.dart';
import 'package:waterwin_app/presentations/account_page/presentations/personal_info_page/presentations/pages/bed_time_page.dart';
import 'package:waterwin_app/presentations/account_page/presentations/personal_info_page/presentations/pages/gender_page.dart';
import 'package:waterwin_app/presentations/account_page/presentations/personal_info_page/presentations/pages/height_page.dart';
import 'package:waterwin_app/presentations/account_page/presentations/personal_info_page/presentations/pages/name_account_page.dart';
import 'package:waterwin_app/presentations/account_page/presentations/personal_info_page/presentations/pages/phone_page.dart';
import 'package:waterwin_app/presentations/account_page/presentations/personal_info_page/presentations/pages/wake_up_page.dart';
import 'package:waterwin_app/presentations/account_page/presentations/personal_info_page/presentations/pages/weather_page.dart';
import 'package:waterwin_app/presentations/account_page/presentations/personal_info_page/presentations/pages/weight_page.dart';
import 'package:waterwin_app/presentations/account_page/presentations/personal_info_page/presentations/personal_information_page.dart';
import 'package:waterwin_app/presentations/point_page/presentations/how_do_i_convert_point_page.dart';
import 'package:waterwin_app/presentations/point_page/presentations/point_page.dart';
import 'package:waterwin_app/presentations/referance_page/presentations/referance_page.dart';
import 'package:waterwin_app/presentations/splash_page/splash_page.dart';
import 'package:waterwin_app/presentations/statistic_page/presentations/statistic_page.dart';
import 'package:injectable/injectable.dart';

final _homepageNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'homepageNavigator');
final _historyNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'historyNavigator');
final _pointsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'pointsNavigator');
final _settingsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'settingsNavigator');
final _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'rootNavigator');

@module
abstract class RouterModule {
  @lazySingleton
  GoRouter goRouter() {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const SplashPage(),
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return MainPage(navigationShell: navigationShell);
          },
          branches: [
            // Dashboard Tab
            StatefulShellBranch(
              navigatorKey: _homepageNavigatorKey,
              routes: [
                GoRoute(
                  path: '/homepage',
                  builder: (context, state) => const HomePage(),
                ),
                GoRoute(
                  path: '/history',
                  builder: (context, state) => const HistoryPage(),
                ),
              ],
            ),
            // Statistics Tab
            StatefulShellBranch(
              navigatorKey: _historyNavigatorKey,
              routes: [
                GoRoute(
                  path: '/statistics',
                  builder: (context, state) => const StatisticPage(),
                ),
              ],
            ),
            // Points Tab
            StatefulShellBranch(
              navigatorKey: _pointsNavigatorKey,
              routes: [
                GoRoute(
                  path: '/points',
                  builder: (context, state) => const PointPage(),
                ),
                GoRoute(
                  path: '/referance',
                  builder: (context, state) => const ReferancePage(),
                ),
                GoRoute(
                  path: '/howtoconvert',
                  builder: (context, state) => const HowDoIConvertMyPointPage(),
                ),
              ],
            ),
            // Settings Tab
            StatefulShellBranch(
              navigatorKey: _settingsNavigatorKey,
              routes: [
                GoRoute(
                  path: '/account',
                  builder: (context, state) => const AccountPage(),
                ),
                GoRoute(
                  path: '/admin',
                  builder: (context, state) => const AdminPage(),
                ),
                GoRoute(
                  path: '/personalinfo',
                  builder: (context, state) => PersonalInfoPage(),
                ),
                GoRoute(
                  path: '/namesurname-account',
                  builder: (context, state) {
                    final informationBloc = state.extra as InformationBloc;
                    return BlocProvider.value(
                      value: informationBloc,
                      child: const NameAccountPage(),
                    );
                  },
                ),
                GoRoute(
                  path: '/phone-account',
                  builder: (context, state) {
                    final informationBloc = state.extra as InformationBloc;
                    return BlocProvider.value(
                      value: informationBloc,
                      child: const PhoneAccountPage(),
                    );
                  },
                ),
                GoRoute(
                  path: '/gender-account',
                  builder: (context, state) {
                    final informationBloc = state.extra as InformationBloc;
                    return BlocProvider.value(
                      value: informationBloc,
                      child: const GenderAccountPage(),
                    );
                  },
                ),
                GoRoute(
                  path: '/height-account',
                  builder: (context, state) {
                    final informationBloc = state.extra as InformationBloc;
                    return BlocProvider.value(
                      value: informationBloc,
                      child: const HeightAccountPage(),
                    );
                  },
                ),
                GoRoute(
                  path: '/weight-account',
                  builder: (context, state) {
                    final informationBloc = state.extra as InformationBloc;
                    return BlocProvider.value(
                      value: informationBloc,
                      child: const WeightAccountPage(),
                    );
                  },
                ),
                GoRoute(
                  path: '/age-account',
                  builder: (context, state) {
                    final informationBloc = state.extra as InformationBloc;
                    return BlocProvider.value(
                      value: informationBloc,
                      child: const AgeAccountPage(),
                    );
                  },
                ),
                GoRoute(
                  path: '/wakeup-account',
                  builder: (context, state) {
                    final informationBloc = state.extra as InformationBloc;
                    return BlocProvider.value(
                      value: informationBloc,
                      child: const WakeUpAccountPage(),
                    );
                  },
                ),
                GoRoute(
                  path: '/bedtime-account',
                  builder: (context, state) {
                    final informationBloc = state.extra as InformationBloc;
                    return BlocProvider.value(
                      value: informationBloc,
                      child: const BedTimeAccountPage(),
                    );
                  },
                ),
                GoRoute(
                  path: '/activity-account',
                  builder: (context, state) {
                    final informationBloc = state.extra as InformationBloc;
                    return BlocProvider.value(
                      value: informationBloc,
                      child: const ActivityLevelAccountPage(),
                    );
                  },
                ),
                GoRoute(
                  path: '/weather-account',
                  builder: (context, state) {
                    final informationBloc = state.extra as InformationBloc;
                    return BlocProvider.value(
                      value: informationBloc,
                      child: const WeatherAccountPage(),
                    );
                  },
                ),
                GoRoute(
                  path: '/drinkreminder',
                  builder: (context, state) => const DrinkReminderPage(),
                ),
                GoRoute(
                  path: '/paymentoptions',
                  builder: (context, state) => const PaymentOptionsPage(),
                ),
                GoRoute(
                  path: '/paymentstatistic',
                  builder: (context, state) {
                    final cubit = state.extra as ProfitListCubit?;
                    return ProfitListPage();
                  },
                ),
                GoRoute(
                  path: '/mypaymentrequests',
                  builder: (context, state) {
                    final cubit = state.extra as ProfitCubit?;
                    return MyPaymentRequestPage();
                  },
                ),
                GoRoute(
                  path: '/change-wallet-id',
                  builder: (context, state) {
                    return const ChangeWalletIdPage();
                  },
                ),
                GoRoute(
                  path: '/accountandsecurity',
                  builder: (context, state) => const AccountAndSecurityPage(),
                ),
                GoRoute(
                  path: '/helpandsupport',
                  builder: (context, state) => const HelpAndSupportPage(),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/authwelcome',
          builder: (context, state) => const AuthWelcomePage(),
        ),
        GoRoute(
          path: '/onboarding',
          builder: (context, state) => const OnboardingPage(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(
          path: '/forgotpassword',
          builder: (context, state) => const ForgotPasswordPage(),
        ),
        GoRoute(
          path: '/otpcode',
          builder: (context, state) {
            final cubit = state.extra as ForgotPasswordCubit;
            return OtpCodePage(
              forgotPasswordCubit: cubit,
            );
          },
        ),
        GoRoute(
          path: '/fpchangepassword',
          builder: (context, state) => const FpChangePasswordPage(),
        ),
        GoRoute(
          path: '/fpchangecompletepage',
          builder: (context, state) => const FpChangeCompletePage(),
        ),
        GoRoute(
          path: '/information',
          builder: (context, state) => const InformationPage(),
        ),
        GoRoute(
          path: '/homepage',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/refreshfailed',
          builder: (context, state) {
            return RefreshFailedPage();
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waterwin_app/core/locator/locator.dart';
import 'package:waterwin_app/core/theme/theme.dart';

class WaterWinWidget extends StatelessWidget {
  const WaterWinWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: getIt<GoRouter>(),
      supportedLocales: const [
        Locale(
          'en',
        ),
      ],
    );
  }
}

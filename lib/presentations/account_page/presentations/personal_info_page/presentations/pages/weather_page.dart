import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waterwin_app/custom_widgets/appbar_widget.dart';
import 'package:waterwin_app/custom_widgets/top_snackbar.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_bloc.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_state.dart';
import 'package:waterwin_app/presentations/information_page/presentations/pages/weather_page.dart';

class WeatherAccountPage extends StatelessWidget {
  const WeatherAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InformationBloc, InformationState>(
      listener: (context, state) {
        if (state.status == const InformationStatus.updateComplete()) {
          context.pop(); // Güncelleme tamamlandığında geri dön
        } else if (state.status == const InformationStatus.error()) {
          showTopSnackBar(context, state.errorMessage);
        }
      },
      child: BlocBuilder<InformationBloc, InformationState>(
        builder: (context, state) {
          return state.status == const InformationStatus.loading()
              ? const Center(child: CircularProgressIndicator())
              : Scaffold(
                  appBar: const AppBarWidget(title: "Weather Condition"),
                  body: Center(
                    child: WeatherPage(
                      onNext: (value) {
                        context.read<InformationBloc>().updateInformation({
                          "weather_condition": value,
                        });
                      },
                      nextButtonText: "Save",
                    ),
                  ),
                );
        },
      ),
    );
  }
}

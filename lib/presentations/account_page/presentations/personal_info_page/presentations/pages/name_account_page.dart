import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waterwin_app/custom_widgets/appbar_widget.dart';
import 'package:waterwin_app/custom_widgets/top_snackbar.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_bloc.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_state.dart';
import 'package:waterwin_app/presentations/information_page/presentations/pages/name_widget.dart';

class NameAccountPage extends StatelessWidget {
  const NameAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InformationBloc, InformationState>(
      listener: (context, state) {
        if (state.status == const InformationStatus.updateComplete()) {
          context.pop(); // Geri dönerken güncellenmiş veriyi görmek için
        } else if (state.status == const InformationStatus.error()) {
          showTopSnackBar(context, state.errorMessage);
        }
      },
      child: BlocBuilder<InformationBloc, InformationState>(
        builder: (context, state) {
          return state.status == const InformationStatus.loading()
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  child: SizedBox(
                    child: Container(
                      child: Center(
                        child: Scaffold(
                          backgroundColor: Colors.white,
                          appBar: const AppBarWidget(title: "Name Surname"),
                          body: NameWidget(
                            onNext: (value) {
                              context
                                  .read<InformationBloc>()
                                  .updateInformation({
                                "name": value,
                              });
                            },
                            nextButtonText: "Save",
                          ),
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}

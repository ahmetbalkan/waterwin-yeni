import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterwin_app/core/theme/sizes.dart';
import 'package:waterwin_app/custom_widgets/appbar_widget.dart';
import 'package:waterwin_app/custom_widgets/top_snackbar.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_bloc.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_state.dart';
import 'package:waterwin_app/presentations/information_page/presentations/pages/gender_widget.dart';

class GenderAccountPage extends StatelessWidget {
  const GenderAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InformationBloc, InformationState>(
      builder: (context, state) {
        return BlocListener<InformationBloc, InformationState>(
          listener: (context, state) {
            if (state.status == const InformationStatus.updateComplete()) {
              context
                  .push('/personalinfo'); // Navigate back on update completion
            } else if (state.status == const InformationStatus.error()) {
              showTopSnackBar(context, state.errorMessage);
            }
          },
          child: state.status == const InformationStatus.loading()
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    appBar: const AppBarWidget(title: "Gender"),
                    body: Center(
                      child: GenderWidget(
                        onNext: (value) {
                          // Passing gender update to InformationBloc
                          context.read<InformationBloc>().updateInformation({
                            "gender": value,
                          });
                        },
                        nextButtonText: "Save",
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}

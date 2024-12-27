import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterwin_app/core/constants/validations/validation.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_bloc.dart';

class NameWidget extends StatefulWidget {
  final String nextButtonText;
  final void Function(String) onNext;

  const NameWidget({
    super.key,
    required this.onNext,
    required this.nextButtonText,
  });

  @override
  NameState createState() => NameState();
}

class NameState extends State<NameWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = context.read<InformationBloc>().state.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Klavye açıldığında ekran yeniden boyutlanır
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // Klavyeyi kapat
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Space(height: 24.h),
                        Text(
                          "What’s your Name?",
                          style: TTextStyles.h3,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
                        Space(height: 8.h),
                        Text(
                          "You must enter your name correctly for later confirmation.",
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          style: TTextStyles.xLargeRegular,
                        ),
                        Space(height: 16.h),
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            hintText: "Enter your name",
                            prefixIcon: Icon(IconlyLight.profile),
                            border: OutlineInputBorder(),
                          ),
                          style: TTextStyles.largeBold,
                          validator: (value) => TValidator.validateName(value),
                        ),
                        Space(height: 48.h),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 16.0.h),
                child: CustomButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus(); // Klavyeyi kapat
                      widget.onNext(_nameController.text);
                    }
                  },
                  padding: 16.w,
                  backgroundColor: TColors.primary,
                  text: widget.nextButtonText,
                  textStyle:
                      TTextStyles.largeBold.copyWith(color: TColors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

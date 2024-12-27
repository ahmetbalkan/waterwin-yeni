import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waterwin_app/core/constants/validations/validation.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/custom_widgets/top_snackbar.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_bloc.dart';

class PhoneWidget extends StatefulWidget {
  final String nextButtonText;
  final void Function(String) onNext;

  const PhoneWidget({
    super.key,
    required this.onNext,
    required this.nextButtonText,
  });

  @override
  _PhoneWidgetState createState() => _PhoneWidgetState();
}

class _PhoneWidgetState extends State<PhoneWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _phoneController.text = context.read<InformationBloc>().state.phoneNumber;
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
                          "What’s your Phone Number?",
                          style: TTextStyles.h3,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
                        Space(height: 8.h),
                        Text(
                          "You must enter your number correctly so that we can verify your money transactions.",
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          style: TTextStyles.xLargeRegular,
                        ),
                        Space(height: 16.h),
                        TextFormField(
                          controller: _phoneController,
                          decoration: const InputDecoration(
                            hintText: "Enter your phone number",
                            prefixIcon: Icon(FontAwesomeIcons.phone),
                            border: OutlineInputBorder(),
                          ),
                          style: TTextStyles.largeBold,
                          keyboardType: TextInputType.phone,
                          validator: (value) =>
                              TValidator.validatePhoneNumber(value),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
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
                    FocusScope.of(context).unfocus(); // Klavyeyi kapat
                    if (_formKey.currentState?.validate() ?? false) {
                      widget.onNext(_phoneController.text);
                    } else {
                      showTopSnackBar(
                          context, 'Please fill in the phone number');
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

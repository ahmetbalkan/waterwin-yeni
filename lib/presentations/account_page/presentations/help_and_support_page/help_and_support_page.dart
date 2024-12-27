import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waterwin_app/core/constants/assets_constants.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/appbar_widget.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/custom_widgets/top_snackbar.dart';

class HelpAndSupportPage extends StatelessWidget {
  const HelpAndSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(title: 'Help and Support'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
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
              width: double.infinity,
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.w),
                      child: SvgPicture.asset(
                        TAssetsConstants.support,
                        width: 300.w,
                      ),
                    ),
                  ),
                  const Space(),
                  Text(
                    "Support",
                    style: TTextStyles.h4.copyWith(
                      color: TColors.black,
                    ),
                  ),
                  const Space(),
                  Text(
                    "You can contact us via e-mail.",
                    style: TTextStyles.mediumRegular.copyWith(
                      color: TColors.black,
                    ),
                  ),
                  const Space(),
                  Container(
                    width: double.infinity,
                    height: 70.w,
                    decoration: BoxDecoration(
                      color: TColors.lightBackground,
                      border: Border.all(
                        color: TColors.primary,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(
                              "support@waterwinapp.com",
                              textAlign: TextAlign.center,
                              style: TTextStyles.xLargeSemibold,
                            )),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            Clipboard.setData(
                                ClipboardData(text: "support@waterwinapp.com"));
                            showTopSnackBar(context, "Copied to clipboard");
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: TColors.primary,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: const Center(
                              child: Icon(FontAwesomeIcons.copy,
                                  color: TColors.white),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  const Space(),
                  Text(
                    "We will get back to you as soon as possible. In the meantime, don't forget to check your e-mails.",
                    style: TTextStyles.mediumRegular.copyWith(
                      color: TColors.black,
                    ),
                  ),
                  const Space(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

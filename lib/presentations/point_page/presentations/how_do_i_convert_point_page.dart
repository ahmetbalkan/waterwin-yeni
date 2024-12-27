import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/appbar_widget.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';

import 'package:flutter/material.dart';
// Import your TColors, TTextStyles, and Space widgets as needed.
// Example:
// import 'package:your_app/styles/t_colors.dart';
// import 'package:your_app/styles/t_text_styles.dart';
// import 'package:your_app/widgets/space.dart';
// Also, make sure you have extension on num => .r if you're using a package like 'flutter_screenutil'

class HowDoIConvertMyPointPage extends StatefulWidget {
  const HowDoIConvertMyPointPage({Key? key}) : super(key: key);

  @override
  State<HowDoIConvertMyPointPage> createState() =>
      _HowDoIConvertMyPointPageState();
}

class _HowDoIConvertMyPointPageState extends State<HowDoIConvertMyPointPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "How Do I Convert My Point?"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          children: [
            // 1. Watch Ads to Earn Balance
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: TColors.greyBackground),
                borderRadius: BorderRadius.circular(8.0.r),
              ),
              child: ExpansionTile(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0.r),
                  borderSide: BorderSide.none,
                ),
                title: Text(
                  '1. Watch Ads to Earn Balance',
                  style: TTextStyles.largeBold,
                ),
                children: [
                  ListTile(
                    title: Text(
                      'By watching the ads displayed in the app, you can earn a '
                      'balance. You can track your earned balance within the app.',
                      style: TTextStyles.largeRegular,
                    ),
                  ),
                ],
              ),
            ),
            const Space(),

            // 2. Minimum Payout: $10
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: TColors.greyBackground),
                borderRadius: BorderRadius.circular(8.0.r),
              ),
              child: ExpansionTile(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0.r),
                  borderSide: BorderSide.none,
                ),
                title: Text(
                  '2. Minimum Payout: \$10',
                  style: TTextStyles.largeBold,
                ),
                children: [
                  ListTile(
                    title: Text(
                      'To request a payout, your balance must be at least \$10. Once '
                      'you reach this amount, you can submit a payout request.',
                      style: TTextStyles.largeRegular,
                    ),
                  ),
                ],
              ),
            ),
            const Space(),

            // 3. Enter Your Wallet ID
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: TColors.greyBackground),
                borderRadius: BorderRadius.circular(8.0.r),
              ),
              child: ExpansionTile(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0.r),
                  borderSide: BorderSide.none,
                ),
                title: Text(
                  '3. Enter Your Wallet ID',
                  style: TTextStyles.largeBold,
                ),
                children: [
                  ListTile(
                    title: Text(
                      'To receive your payments in coin form, you need to enter '
                      'your wallet ID in the relevant field. Your payout request '
                      'cannot be processed without your wallet information.',
                      style: TTextStyles.largeRegular,
                    ),
                  ),
                ],
              ),
            ),
            const Space(),

            // 4. Payment Transaction and Transfer Fee
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: TColors.greyBackground),
                borderRadius: BorderRadius.circular(8.0.r),
              ),
              child: ExpansionTile(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0.r),
                  borderSide: BorderSide.none,
                ),
                title: Text(
                  '4. Payment Transaction and Transfer Fee',
                  style: TTextStyles.largeBold,
                ),
                children: [
                  ListTile(
                    title: Text(
                      'Payments are made via a coin with a low transfer fee and '
                      'a stable value. If there is a transfer fee, it is charged '
                      'to the user. You can view the fee in the app before '
                      'initiating the transfer.',
                      style: TTextStyles.largeRegular,
                    ),
                  ),
                ],
              ),
            ),
            const Space(),

            // 5. Payment Dates and Waiting Period
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: TColors.greyBackground),
                borderRadius: BorderRadius.circular(8.0.r),
              ),
              child: ExpansionTile(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0.r),
                  borderSide: BorderSide.none,
                ),
                title: Text(
                  '5. Payment Dates and Waiting Period',
                  style: TTextStyles.largeBold,
                ),
                children: [
                  ListTile(
                    title: Text(
                      'Payments are made at the beginning of each month. If you '
                      'miss the request window, you will have to wait until the '
                      'beginning of the following month.',
                      style: TTextStyles.largeRegular,
                    ),
                  ),
                ],
              ),
            ),
            const Space(),

            // 6. Step-by-Step Process Flow
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: TColors.greyBackground),
                borderRadius: BorderRadius.circular(8.0.r),
              ),
              child: ExpansionTile(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0.r),
                  borderSide: BorderSide.none,
                ),
                title: Text(
                  '6. Step-by-Step Process Flow',
                  style: TTextStyles.largeBold,
                ),
                children: [
                  ListTile(
                    title: Text(
                      '1. Watch ads to increase your balance.\n'
                      '2. When your balance is \$10 or more, proceed to the "Request Payout" step.\n'
                      '3. Enter your wallet ID accurately.\n'
                      '4. Once approved, the coin transfer will occur, and any applicable transfer fee will be deducted from your balance.\n'
                      '5. Your transfer request will be processed at the start of the month and should appear in your wallet within a few days.',
                      style: TTextStyles.largeRegular,
                    ),
                  ),
                ],
              ),
            ),
            const Space(),

            // 7. Troubleshooting and Support
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: TColors.greyBackground),
                borderRadius: BorderRadius.circular(8.0.r),
              ),
              child: ExpansionTile(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0.r),
                  borderSide: BorderSide.none,
                ),
                title: Text(
                  '7. Troubleshooting and Support',
                  style: TTextStyles.largeBold,
                ),
                children: [
                  ListTile(
                    title: Text(
                      'If you enter your wallet address incorrectly, your funds '
                      'may be sent to the wrong address, and we cannot be held '
                      'responsible. If you face any issues, please reach out '
                      'via our in-app support or through our contact addresses.',
                      style: TTextStyles.largeRegular,
                    ),
                  ),
                ],
              ),
            ),
            const Space(),
          ],
        ),
      ),
    );
  }
}

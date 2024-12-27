import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waterwin_app/core/constants/assets_constants.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/presentations/statistic_page/domain/model/bottle_model.dart';

List<BottleModel> bottles = [
  BottleModel(
      id: 1, svgAsset: TAssetsConstants.logoBlue, name: "25 mL", ml: 25),
  BottleModel(id: 2, svgAsset: TAssetsConstants.size50, name: "50 mL", ml: 50),
  BottleModel(
      id: 3, svgAsset: TAssetsConstants.size100, name: "100 mL", ml: 100),
  BottleModel(
      id: 4, svgAsset: TAssetsConstants.size125, name: "125 mL", ml: 125),
  BottleModel(
      id: 5, svgAsset: TAssetsConstants.size150, name: "150 mL", ml: 150),
  BottleModel(
      id: 6, svgAsset: TAssetsConstants.size200, name: "200 mL", ml: 200),
  BottleModel(
      id: 7, svgAsset: TAssetsConstants.size250, name: "250 mL", ml: 250),
  BottleModel(
      id: 8, svgAsset: TAssetsConstants.size300, name: "300 mL", ml: 300),
  BottleModel(
      id: 9, svgAsset: TAssetsConstants.size350, name: "350 mL", ml: 350),
  BottleModel(
      id: 10, svgAsset: TAssetsConstants.size400, name: "400 mL", ml: 400),
  BottleModel(
      id: 11, svgAsset: TAssetsConstants.size500, name: "500 mL", ml: 500),
  BottleModel(
      id: 12, svgAsset: TAssetsConstants.size600, name: "600 mL", ml: 600),
];

class BottleChoiseWidget extends StatelessWidget {
  final Function(BottleModel) onBottleSelected;

  const BottleChoiseWidget({
    super.key,
    required this.onBottleSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // 4 columns per row
        crossAxisSpacing: 16.w, // Spacing between columns
        mainAxisSpacing: 16.h, // Spacing between rows
        childAspectRatio: 0.8, // Aspect ratio
      ),
      itemCount: bottles.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // Notify parent widget
            onBottleSelected(bottles[index]);
            // Close the current screen or dialog
            Navigator.pop(context);
          },
          child: BottlesWidget(
            svgAsset: bottles[index].svgAsset,
            volume: bottles[index].name,
            ml: bottles[index].ml,
          ),
        );
      },
    );
  }
}

class BottlesWidget extends StatelessWidget {
  final String svgAsset;
  final String volume;
  final int ml;

  const BottlesWidget({
    super.key,
    required this.svgAsset,
    required this.volume,
    required this.ml,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
            color: TColors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFFEEEEEE), // Açık gri renk
              width: 2,
            ),
          ),
          child: Center(
            child: SvgPicture.asset(
              svgAsset, // SVG ikon
              width: 30.w,
              height: 30.w,
            ),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          volume,
          style: TextStyle(
            fontSize: 12.sp,
            color: const Color(0xFF333333), // Yazı rengi
          ),
        ),
      ],
    );
  }
}

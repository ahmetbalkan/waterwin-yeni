import 'package:flutter/material.dart';
import 'package:waterwin_app/core/theme/sizes.dart';

class Space extends StatelessWidget {
  const Space({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? TSizes.customSizesW,
        height: height ?? TSizes.customSizesH);
  }
}

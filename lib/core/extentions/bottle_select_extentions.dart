import 'package:waterwin_app/core/constants/assets_constants.dart';

extension BottleAssetSelector on int {
  String get svgAsset {
    final List<String> assets = [
      TAssetsConstants.logoBlue, // 1
      TAssetsConstants.size50, // 2
      TAssetsConstants.size100, // 3
      TAssetsConstants.size125, // 4
      TAssetsConstants.size150, // 5
      TAssetsConstants.size200, // 6
      TAssetsConstants.size250, // 7
      TAssetsConstants.size300, // 8
      TAssetsConstants.size350, // 9
      TAssetsConstants.size400, // 10
      TAssetsConstants.size500, // 11
      TAssetsConstants.size600, // 12
    ];

    if (this < 1) {
      // 0 veya negatif değerler için varsayılan bir değer döndür
      return TAssetsConstants.logoBlue;
    }

    // Gelen değeri 1 ve assets listesinin sınırları arasında sınırlandırıyoruz
    int clampedIndex = this.clamp(1, assets.length);

    // Listeler 0 tabanlı olduğundan, 1 tabanlı indeksi 0 tabanlı hale getiriyoruz
    return assets[clampedIndex - 1];
  }
}

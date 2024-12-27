import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:waterwin_app/core/extentions/bottle_select_extentions.dart';
import 'package:waterwin_app/core/extentions/datetime_extentions.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/appbar_widget.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/presentations/home_page/presentations/bloc/homepage_cubit.dart';
import 'package:waterwin_app/presentations/home_page/presentations/bottle_choise_page.dart';

class HomePage extends StatefulWidget {
  final HomepageCubit? homepageCubit;
  const HomePage({super.key, this.homepageCubit});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomepageCubit _homepageCubit;

  @override
  void initState() {
    _homepageCubit = widget.homepageCubit ?? HomepageCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _homepageCubit,
      child: BlocBuilder<HomepageCubit, HomepageState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: TColors.greyBackground,
              appBar: const AppBarWidget(title: "Homepage"),
              body: SizedBox(
                width: 1.sw,
                height: 1.sh,
                child: SingleChildScrollView(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: ConstrainedBox(
                        // İçeriğin ne kadar büyüyüp/küçülebileceğini sınırlıyoruz
                        constraints: BoxConstraints(
                          maxWidth: 1.sw, // En fazla tam ekran genişliğinde
                          minWidth: 1.sw, // Minimum da tam ekran genişliğinde
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Space(
                              height: 20.h,
                            ),
                            Container(
                              padding: EdgeInsets.all(24.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.w),
                                color: Colors.white,
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
                                  CustomPaint(
                                    size: Size(250.w, 250.w),
                                    painter: CombinedCircularProgressPainter(
                                      total: state.totalDays.toDouble(),
                                      current: state.totalPoints.toDouble(),
                                    ),
                                  ),
                                  SizedBox(height: 32.w),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomButton(
                                        onTap: state.status !=
                                                    HomepageStatus.loading &&
                                                state.isButtonEnabled
                                            ? () async {
                                                context
                                                    .read<HomepageCubit>()
                                                    .loadAndShowRewardedAd();
                                              }
                                            : null,
                                        padding: 16.w,
                                        backgroundColor: state.status ==
                                                HomepageStatus.loading
                                            ? TColors.buttonLight
                                            : TColors.primary,
                                        borderColor: Colors.transparent,
                                        text: state.status ==
                                                HomepageStatus.loading
                                            ? 'Loading...'
                                            : state.isButtonEnabled
                                                ? "Drink ${state.bottle.ml} mL"
                                                : "Wait: ${_formatRemainingTime(state.remainingSeconds)}",
                                        textStyle: TextStyle(
                                          color: state.status ==
                                                  HomepageStatus.loading
                                              ? TColors.black
                                              : TColors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        icon: state.status ==
                                                HomepageStatus.loading
                                            ? Icons.refresh
                                            : null,
                                        iconSize: 20.w,
                                        isCompact: true,
                                        width: 200.w,
                                      ),
                                      SizedBox(width: 16.w),
                                      InkWell(
                                        onTap: () async {
                                          _settingModalBottomSheet(context);
                                        },
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(4.0.w),
                                              child: Container(
                                                width: 50.w,
                                                height: 50.w,
                                                padding: EdgeInsets.all(14.w),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          60.r),
                                                  border: Border.all(
                                                      color:
                                                          Colors.grey.shade300),
                                                  color: Colors.white,
                                                ),
                                                child: SvgPicture.asset(
                                                  state.bottle.svgAsset,
                                                  width: 24.w,
                                                  height: 24.w,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              right: 0,
                                              bottom: 0,
                                              child: Container(
                                                width: 27.w,
                                                height: 27.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          32.r),
                                                  border: Border.all(
                                                      color:
                                                          Colors.grey.shade300),
                                                  color: Colors.white,
                                                ),
                                                child: Center(
                                                  child: FaIcon(
                                                    FontAwesomeIcons.repeat,
                                                    color: Colors.grey,
                                                    size: 12.w,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Space(
                              height: 20.h,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16.w, horizontal: 16.w),
                              decoration: BoxDecoration(
                                color: TColors.white,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "History",
                                        style: TTextStyles.h5.copyWith(
                                          color: TColors.black,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          context.push('/history');
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "View All",
                                              style: TTextStyles.largeBold
                                                  .copyWith(
                                                      color: TColors.primary),
                                            ),
                                            const Space(),
                                            Icon(
                                              FontAwesomeIcons.arrowRight,
                                              size: 16.w,
                                              color: TColors.primary,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: TColors.buttonStroke,
                                    thickness: 1.w,
                                  ),
                                  state.points.isNotEmpty
                                      ? ListView.separated(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.h),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: SvgPicture.asset(
                                                      state.points[index]
                                                          .glasstype!.svgAsset,
                                                      width: 40.w,
                                                      height: 40.w,
                                                    ),
                                                  ),
                                                  Space(
                                                    width: 24.w,
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Water",
                                                          style: TTextStyles.h6
                                                              .copyWith(
                                                            color:
                                                                TColors.black,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        Text(
                                                          state.points[index]
                                                              .createdAt!
                                                              .toFormattedDateTime(),
                                                          style: TTextStyles
                                                              .smallRegular
                                                              .copyWith(
                                                            color: TColors
                                                                .textGrey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "${state.points[index].wateramount} mL",
                                                      style: TTextStyles.h6
                                                          .copyWith(
                                                        color: TColors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, index) =>
                                              Divider(
                                            color: TColors.buttonStroke,
                                            thickness: 1.w,
                                          ),
                                          itemCount: state.points.length,
                                        )
                                      : Center(
                                          child: Text("No data available"),
                                        ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
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

  String _formatRemainingTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _settingModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: TColors.white,
        constraints: const BoxConstraints(
          maxWidth: double.infinity,
        ),
        builder: (BuildContext bc) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      width: 38.w,
                      height: 3.h,
                      decoration: BoxDecoration(
                        color: TColors.textGrey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.r),
                        ),
                      )),
                  Space(height: 16.w),
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              context.pop();
                            },
                            child: Icon(FontAwesomeIcons.xmark,
                                size: 24.w, color: TColors.black),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text("Switch Cup Size",
                            textAlign: TextAlign.start,
                            style: TTextStyles.h4.copyWith(
                              color: TColors.black,
                            )),
                      ),
                    ],
                  ),
                  Space(height: 8.w),
                  const Divider(),
                  Space(height: 8.w),
                  BottleChoiseWidget(
                    onBottleSelected: (bottle) {
                      context.read<HomepageCubit>().changeBottle(bottle);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class CombinedCircularProgressPainter extends CustomPainter {
  final double current; // Yapılan değer (örn. 1650)
  final double total; // Toplam değer (örn. 2500)

  CombinedCircularProgressPainter({required this.current, required this.total});

  @override
  void paint(Canvas canvas, Size size) {
    // Progress oranını hesaplama
    double progress = total > 0 ? (current / total).clamp(0.0, 1.0) : 0.0;

// Round the progress to the nearest 5%
    if (progress > 0.0 && progress < 1.0) {
      progress = (progress * 20).ceil() / 20; // 1/20 = 5% steps
    }

    // Dairesel ilerleme çubuğu özellikleri
    double strokeWidth = 24.0.w; // İlerleme çubuğunun kalınlığı
    double radius = (min(size.width, size.height) - strokeWidth) / 2;
    Offset center = Offset(size.width / 2, size.height / 2);

    // Boşluk ayarları (aşağıda boşluk bırakmak için)
    double gapPercentage = 0.2; // Boşluk yüzdesi (%20)
    double gapAngle = 2 * pi * gapPercentage; // Boşluk açısı (radyan cinsinden)

    // Başlangıç açısı ve süpürme açısı
    double startAngle =
        pi / 2 + gapAngle / 2; // Boşluğun alt kısımda olması için
    double sweepAngle =
        2 * pi - gapAngle; // Toplam süpürme açısı (boşluk hariç)

    // İlerleme süpürme açısı
    double progressSweepAngle = sweepAngle * progress;

    // Arka plan çemberi (boş kısım)
    Paint backgroundPaint = Paint()
      ..color = const Color(0xFFEEEEEE) // Boş renk
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round; // Yuvarlak uçlar

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      backgroundPaint,
    );

    // Ön plan çemberi (dolu kısım)
    Paint foregroundPaint = Paint()
      ..color = const Color(0xFF369FFF) // Dolu renk
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round; // Yuvarlak uçlar

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      progressSweepAngle.clamp(0.0, sweepAngle),
      false,
      foregroundPaint,
    );

    // Su damlasını çizme
    // Su damlasının boyutunu belirleme (daireye uygun olarak)
    double scalingFactor =
        min(size.width, size.height) / 400.w; // Orantılı boyut belirleme
    double waterdropWidth = 130.w * scalingFactor;
    double waterdropHeight = 190.w * scalingFactor;

    // Su damlasının konumu (dairenin ortasında olacak)
    double waterdropX = (size.width - waterdropWidth) / 2;
    double waterdropY = (size.height - waterdropHeight) / 2;

    // Canvas'ı kaydet ve su damlasının konumuna taşı
    canvas.save();
    canvas.translate(waterdropX, waterdropY);

    // Su damlasını çiz (aynı progress değerini kullanarak)
    WaterdropWithShadowPainter waterdropPainter = WaterdropWithShadowPainter(
      percentage: progress,
    );

    // Su damlasını boyutlandırarak çiz
    waterdropPainter.paint(
      canvas,
      Size(waterdropWidth, waterdropHeight),
    );

    // Canvas'ı eski haline getir
    canvas.restore();

    // Yazıyı çizme
    _drawProgressText(canvas, size, center, radius, strokeWidth);
  }

  void _drawProgressText(Canvas canvas, Size size, Offset center, double radius,
      double strokeWidth) {
    // Yazının konumu: dairesel çubuğun alt kısmının ortası
    double textCenterX = size.width / 2;
    double textCenterY = size.height / 2 +
        radius -
        strokeWidth / 2; // Biraz daha aşağıya kaydırma

    // "current" için TextPainter
    TextSpan spanLarge = TextSpan(
      style: TTextStyles.h4.copyWith(color: Colors.black),
      text: '${current.round()}',
    );

    TextPainter tpLarge = TextPainter(
      text: spanLarge,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    tpLarge.layout();

    // "total" için TextPainter
    TextSpan spanSmall = TextSpan(
      style: TTextStyles.largeBold.copyWith(color: TColors.textGrey),
      text: '/ ${total.round()} mL',
    );

    TextPainter tpSmall = TextPainter(
      text: spanSmall,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    tpSmall.layout();

    // Yazı arasındaki boşluk
    double spacing = 4.w;

    // Toplam yazı yüksekliği
    double totalHeight = tpLarge.height + spacing + tpSmall.height;

    // Başlangıç noktası (üst yazı için)
    Offset largeTextOffset = Offset(
      textCenterX - tpLarge.width / 2,
      textCenterY - totalHeight / 2,
    );

    // "current" yazısını çiz
    tpLarge.paint(canvas, largeTextOffset);

    // "total mL" yazısını çiz
    Offset smallTextOffset = Offset(
      textCenterX - tpSmall.width / 2,
      largeTextOffset.dy + tpLarge.height + spacing,
    );
    tpSmall.paint(canvas, smallTextOffset);
  }

  @override
  bool shouldRepaint(covariant CombinedCircularProgressPainter oldDelegate) {
    return oldDelegate.current != current || oldDelegate.total != total;
  }
}

class WaterdropWithShadowPainter extends CustomPainter {
  final double percentage;

  WaterdropWithShadowPainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    // Su damlasının dış hatlarını oluştur
    Path waterdropPath = Path();

    // Yükseklik oranları
    double triangleHeight = size.height * (1 / 3);
    double roundHeight = size.height * (2 / 3);

    // Yarım dairenin merkezi ve yarıçapı
    double centerX = size.width / 2;
    double centerY = triangleHeight + roundHeight / 2;
    double radius = size.width / 2;

    // Su damlasının tepe noktası
    Offset topPoint = Offset(centerX, 0);

    // Sol ve sağ başlangıç noktaları
    Offset leftStart = Offset(centerX - radius, centerY);
    Offset rightStart = Offset(centerX + radius, centerY);

    // Su damlasının dış hatlarını çiz
    waterdropPath.moveTo(leftStart.dx, leftStart.dy);

    // Sol kıvrımlı kenar
    waterdropPath.cubicTo(
      centerX - radius,
      centerY - roundHeight * 0.5,
      centerX - radius * 0.2,
      triangleHeight * 0.5,
      topPoint.dx,
      topPoint.dy,
    );

    // Sağ kıvrımlı kenar
    waterdropPath.cubicTo(
      centerX + radius * 0.2,
      triangleHeight * 0.5,
      centerX + radius,
      centerY - roundHeight * 0.5,
      rightStart.dx,
      rightStart.dy,
    );

    // Yarım daireyi çiz
    Rect rect =
        Rect.fromCircle(center: Offset(centerX, centerY), radius: radius);
    waterdropPath.arcTo(rect, 0, pi, false);

    waterdropPath.close();

    // Gölge çizimi
    Paint shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.08)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);
    canvas.drawPath(waterdropPath.shift(const Offset(0, 5)), shadowPaint);

    // Gri dolgu boyası
    Paint grayFillPaint = Paint()
      ..color = const Color(0xFFEEEEEE)
      ..style = PaintingStyle.fill;
    canvas.drawPath(waterdropPath, grayFillPaint);

    // Su damlasının doluluk seviyesi
    double filledHeight = size.height * (percentage - (percentage % 0.05));

    // Dalga parametreleri
    double waveAmplitude =
        20.0.w; // Dalga yüksekliği (daha geniş U'lar için arttırıldı)

    // Dalga yolunu oluştur
    Path wavePath = Path();
    double waveStartY = size.height - filledHeight;
    wavePath.moveTo(0, waveStartY);

    double waveLength = size.width;

    // Kontrollü noktalar ile cubicTo kullanarak tek bir dalgayı çiz
    double controlX1 = waveLength * 0.25;
    double controlY1 = waveStartY - waveAmplitude;

    double controlX2 = waveLength * 0.75;
    double controlY2 = waveStartY + waveAmplitude;

    double endX = waveLength;
    double endY = waveStartY;

    wavePath.cubicTo(controlX1, controlY1, controlX2, controlY2, endX, endY);

    // Dalga yolunu tamamla
    wavePath.lineTo(size.width, size.height);
    wavePath.lineTo(0, size.height);
    wavePath.close();

    // Mavi doluluk boyası
    Paint fillPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF369FFF), Color(0xFF0064FF)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(
          0, size.height - filledHeight, size.width, filledHeight))
      ..style = PaintingStyle.fill;

    // Su damlasına clip uygula ve doluluk seviyesini boya
    canvas.save();
    canvas.clipPath(waterdropPath);
    canvas.drawPath(wavePath, fillPaint);

    // Ters dalga ekle (0062E5 renginde)
    Path reverseWavePath = Path();
    double reverseWaveStartY = size.height - filledHeight;
    reverseWavePath.moveTo(0, reverseWaveStartY);

    // Ters dalga parametreleri
    double reverseControlX1 = waveLength * 0.25;
    double reverseControlY1 = reverseWaveStartY + waveAmplitude;

    double reverseControlX2 = waveLength * 0.75;
    double reverseControlY2 = reverseWaveStartY - waveAmplitude;

    double reverseEndX = waveLength;
    double reverseEndY = reverseWaveStartY;

    reverseWavePath.cubicTo(reverseControlX1, reverseControlY1,
        reverseControlX2, reverseControlY2, reverseEndX, reverseEndY);

    // Ters dalga yolunu tamamla
    reverseWavePath.lineTo(size.width, size.height);
    reverseWavePath.lineTo(0, size.height);
    reverseWavePath.close();

    // Ters dalga boyası (0062E5)
    Paint reverseFillPaint = Paint()
      ..color = const Color(0xFF0062E5)
      ..style = PaintingStyle.fill;

    // Ters dalgayı boya
    canvas.drawPath(reverseWavePath, reverseFillPaint);

    // Orijinal dalgayı tekrar boya
    canvas.drawPath(wavePath, fillPaint);
    canvas.restore();

    // Damlanın etrafına stroke ekle
    Paint strokePaint = Paint()
      ..color = const Color(0xFFF5F5F5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(waterdropPath, strokePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

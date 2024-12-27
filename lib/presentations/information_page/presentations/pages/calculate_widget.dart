import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_bloc.dart';

class CalculatePage extends StatefulWidget {
  final VoidCallback onCalculationComplete;

  const CalculatePage({super.key, required this.onCalculationComplete});

  @override
  CalculatePageState createState() => CalculatePageState();
}

class CalculatePageState extends State<CalculatePage> {
  double progress = 0.0;

  @override
  void initState() {
    super.initState();

    _startProgress(); // İlerlemenin başlatılması
  }

  void _startProgress() {
    context.read<InformationBloc>().calculateDailyGoal();
    Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {
        if (progress < 1.0) {
          progress += 0.02;
        } else {
          timer.cancel();
          widget.onCalculationComplete();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Generating personalized hydration plan for you...',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Please wait...',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 200.w,
                  width: 200.w,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 16,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(TColors.primary),
                    backgroundColor: TColors.buttonStroke,
                  ),
                ),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Text(
              'This will just take a moment. Get ready to transform your hydration journey!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CountdownTimerScreen extends StatefulWidget {
  @override
  _CountdownTimerScreenState createState() => _CountdownTimerScreenState();
}

class _CountdownTimerScreenState extends State<CountdownTimerScreen> {
  int _totalTime = 3600; // 1 ساعة (بالثواني)
  int _remainingTime = 3600;
  Timer? _timer;
  double percent = 1.0; // يبدأ فارغًا

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
          percent = 1 - (_remainingTime / _totalTime); // زيادة تدريجية
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int secs = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularPercentIndicator(
        radius: 120.0,
        lineWidth: 20.0,
        percent: percent,
        center: Text(formatTime(_remainingTime),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: Assets.textfamily)),
        progressColor: Color.fromARGB(255, 140, 180, 193),
        backgroundColor: Colors.grey[300]!,
        animateFromLastPercent: true,
        animationDuration: 1,
        reverse: true,
        circularStrokeCap: CircularStrokeCap.round,
      ),
    );
  }
}

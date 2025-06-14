import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/constant.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressiveTimer extends StatefulWidget {
  const ProgressiveTimer(
      {super.key,
      required this.second,
      required this.minute,
      required this.hour});
  final int second;
  final int minute;
  final int hour;

  @override
  _ProgressiveTimerState createState() => _ProgressiveTimerState();
}

class _ProgressiveTimerState extends State<ProgressiveTimer> {
  int seconds = 0;
  int minutes = 0;
  int hours = 0;
  int days = 0;
  Timer? timer;

  // Arbitrary large goal just for progress
  final int targetInSeconds = 7 * 24 * 60 * 60; // 7 days

  @override
  void initState() {
    super.initState();
    seconds = widget.second;
    minutes = widget.minute;
    hours = widget.hour;
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        seconds++;
        if (seconds >= 60) {
          seconds = 0;
          minutes++;
        }
        if (minutes >= 60) {
          minutes = 0;
          hours++;
        }
        if (hours >= 24) {
          hours = 0;
          days++;
        }
      });
    });
  }

  double get progressPercent {
    int totalSeconds = seconds + minutes * 60 + hours * 3600 + days * 86400;
    return (totalSeconds / targetInSeconds).clamp(0.0, 1.0);
  }

  String getFormattedTime() {
    return "$hours h : $minutes m : $seconds s";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularPercentIndicator(
        radius: 120.0,
        lineWidth: 15.0,
        percent: progressPercent,
        progressColor: kprimaryColor,
        backgroundColor: Colors.grey[400]!,
        circularStrokeCap: CircularStrokeCap.round,
        center: Text(
          getFormattedTime(),
          style: TextStyle(
            fontSize: 20,
            fontFamily: Assets.textfamily,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

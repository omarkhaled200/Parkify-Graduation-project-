import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';

import 'package:parkify/Feature/Home/persentation/View_Model/Get%20Count%20down%20data/get_count_down_data_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Manage_Page/manage_page_cubit.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CountdownTimerScreen extends StatefulWidget {
  const CountdownTimerScreen({Key? key, required this.user}) : super(key: key);

  final UserModel user;
  @override
  _CountdownTimerScreenState createState() => _CountdownTimerScreenState();
}

class _CountdownTimerScreenState extends State<CountdownTimerScreen> {
  Timer? _timer;
  double percent = 0.0;
  int _remainingTime = 0;
  int _totalTime = 1;

  @override
  void initState() {
    super.initState();
    context
        .read<GetCountDownDataCubit>()
        .getCountDowndata(token: widget.user.token!);
  }

  void startTimer(int totalTime, int remainingTime) {
    _timer?.cancel();
    _totalTime = totalTime;
    _remainingTime = remainingTime;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
          percent = 1 - (_remainingTime / _totalTime);
        });
      } else {
        timer.cancel();
        context.read<ManagePageCubit>().countdownFinished();
      }
    });
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
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCountDownDataCubit, GetCountDownDataState>(
      builder: (context, state) {
        if (state is GetCountDownDataLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetCountDownDataFailure) {
          return Center(child: Text("Error: ${state.errmessage}"));
        } else if (state is GetCountDownDataSuccess) {
          final data = state.countdowndata;

          if (_timer == null) {
            startTimer(data.reservationDifference!, data.countdown!);
          }

          return Center(
            child: CircularPercentIndicator(
              radius: 120.0,
              lineWidth: 15.0,
              percent: percent.clamp(0.0, 1.0),
              center: Text(
                formatTime(_remainingTime),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: Assets.textfamily),
              ),
              progressColor: const Color.fromARGB(255, 140, 180, 193),
              backgroundColor: Colors.grey[300]!,
              animateFromLastPercent: true,
              animationDuration: 1,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

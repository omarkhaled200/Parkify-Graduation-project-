import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/Get%20user%20point%20and%20balance/User_Balance_Point_Cubit/user_balance_point_cubit.dart';
import 'package:parkify/Core/utlis/App_Router.dart';

import 'package:parkify/Core/utlis/CustomButton.dart';
import 'package:parkify/Core/utlis/Functions/CustomScaffoldMessenger.dart';
import 'package:parkify/Core/utlis/Icon_All_app.dart';
import 'package:parkify/Core/utlis/assets.dart';

import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Home/data/Model/LocationModel/LocatiomModel.dart';

import 'package:parkify/Feature/Home/persentation/View_Model/Get_User_Plates/get_user_plates_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/MQTT_Mange_Cubit/mqtt_cubit.dart';

import 'package:parkify/Feature/Home/persentation/View_Model/Manage_Page/manage_page_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Reserve_Spot_Cubit/reserve_spot_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Spot%20Detials%20Cubit/Get%20Spot%20Detials/get_spot_detials_cubit.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/Currentloationcard.dart';

import 'package:parkify/Feature/Home/persentation/Views/Widgets/CustomDrowdown.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/CustomTimeOfDay.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/DisplayMoneyWidget.dart';

import 'package:parkify/Feature/Home/persentation/Views/Widgets/PremiumReserveSpotParking.dart';

import 'package:parkify/constant.dart';

class ReservationViewbody extends StatefulWidget {
  const ReservationViewbody({
    super.key,
  });

  @override
  State<ReservationViewbody> createState() => _ReservationViewbodyState();
}

class _ReservationViewbodyState extends State<ReservationViewbody> {
  String? _selectedPlate;
  TimeOfDay? _selectedTime;

  // إضافة متغير لحفظ الـ MQTT data
  String? _mqttMessage;
  bool _mqttLoading = true;
  bool _mqttError = false;

  late LocationModel location;
  late UserModel userdata;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var extra = GoRouterState.of(context).extra as Map<String, dynamic>;
    location = extra['location'] as LocationModel;
    userdata = extra['userdata'] as UserModel;

    context.read<MqttCubit>().connect(
          server: '9bc5584a65f949e38d5b271a699d2084.s1.eu.hivemq.cloud',
          port: 8883,
          clientId: 'flutterClientId${location.name}',
          topic: 'garage/${location.name}/available_spots',
          username: 'iotwebconnection',
          password: 'iotwebConnection1',
        );
  }

  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print('the location id is : ${location.id}');
    return BlocConsumer<ReserveSpotCubit, ReserveSpotState>(
      listener: (context, state) async {
        if (state is ReserveSpotFailure) {
          CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark, Colors.red);
        } else if (state is ReserveSpotSuccess) {
          CustomScaffoldMessenger(
              context, 'Success', Icons.check_circle_outline, Colors.green);
          await context.read<ManagePageCubit>().reserve();

          GoRouter.of(context).go(AppRouter.bottomNaviagationBar,
              extra: {'userdata': userdata, 'location': location});
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kprimaryColor,
            title: IconApp(width: width),
            actions: [
              BlocBuilder<UserBalancePointCubit, UserBalancePointState>(
                builder: (context, state) {
                  if (state is UserBalancePointSuccess) {
                    return DisplaymoneyWidget(
                      width: width,
                      price: state.value.balance!,
                    );
                  } else if (state is UserBalancePointFailure) {
                    CustomScaffoldMessenger(
                        context,
                        "Error is : ${state.errmessage}",
                        FontAwesomeIcons.circleXmark,
                        Colors.red);
                    return Text('Failed to load balance');
                  } else {
                    return const Center(
                      child: SpinKitFadingCircle(color: Colors.black),
                    );
                  }
                },
              ),
            ],
          ),
          body: BlocBuilder<GetSpotDetialsCubit, GetSpotDetialsState>(
            builder: (context, state) {
              if (state is GetSpotDetialsSuccess) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Currentloationcard(
                            loc: location,
                          ),
                          SizedBox(height: heaight * 0.02),
                          SizedBox(
                            height: heaight * 0.35,
                            child: BlocConsumer<MqttCubit, MqttState>(
                              listener: (context, mqttState) {
                                // هنا بنسمع للتغييرات وبنحفظ الداتا في الـ state
                                if (mqttState is MqttMessageReceived) {
                                  setState(() {
                                    _mqttMessage = mqttState.message;
                                    _mqttLoading = false;
                                    _mqttError = false;
                                  });
                                } else if (mqttState is MqttDisconnected) {
                                  setState(() {
                                    _mqttError = true;
                                    _mqttLoading = false;
                                  });
                                  CustomScaffoldMessenger(
                                    context,
                                    "Error is : Mqtt Disconnected",
                                    FontAwesomeIcons.circleXmark,
                                    Colors.red,
                                  );
                                } else if (mqttState is MqttError) {
                                  setState(() {
                                    _mqttError = true;
                                    _mqttLoading = false;
                                  });
                                }
                              },
                              builder: (context, mqttState) {
                                // هنا بنعرض الداتا المحفوظة مش الـ state الحالي
                                if (_mqttMessage != null && !_mqttError) {
                                  return Column(
                                    children: [
                                      PremiumReserveSpotParking(
                                        numberSpot: _mqttMessage!,
                                      ),
                                    ],
                                  );
                                } else if (_mqttError) {
                                  return const Center(
                                    child: Text('Failed to connect'),
                                  );
                                } else if (_mqttLoading) {
                                  return const Center(
                                    child: SpinKitFadingCircle(
                                        color: Colors.black),
                                  );
                                } else {
                                  return const Center(
                                    child: Text('Failed to load data'),
                                  );
                                }
                              },
                            ),
                          ),
                          SizedBox(height: heaight * 0.01),
                          BlocBuilder<GetUserPlatesCubit, GetUserPlatesState>(
                            builder: (context, state) {
                              if (state is GetUserPlatesSuccess) {
                                if (_selectedPlate == null &&
                                    state.plate.isNotEmpty) {
                                  _selectedPlate = state.plate[0].plate;
                                }
                                return CustomDrowdown(
                                  list: state.plate
                                      .map((plate) => plate.plate!)
                                      .toList(),
                                  selectedPlate: _selectedPlate!,
                                  text: 'Select License Plate',
                                  onChanged: (selectedValue) {
                                    setState(() {
                                      _selectedPlate = selectedValue;
                                    });
                                  },
                                );
                              } else if (state is GetUserPlatesFailure) {
                                CustomScaffoldMessenger(
                                    context,
                                    "Error is : ${state.errmessage}",
                                    FontAwesomeIcons.circleXmark,
                                    Colors.red);
                                return const Center(
                                  child: Text('Failed to load data'),
                                );
                              } else {
                                return const SpinKitFadingCircle(
                                    color: Colors.black);
                              }
                            },
                          ),
                          SizedBox(height: heaight * 0.01),
                          CustomTimeOfDay(
                            onTimeChanged: (TimeOfDay newTime) {
                              setState(() {
                                _selectedTime = newTime;
                              });
                            },
                          ),
                          SizedBox(height: heaight * 0.01),
                          if (_selectedTime != null) ...[
                            Builder(builder: (context) {
                              final now = DateTime.now();
                              final nowTrimmed = DateTime(now.year, now.month,
                                  now.day, now.hour, now.minute); // حذف الثواني

                              final selectedTime = _selectedTime!;
                              DateTime selectedDateTime = DateTime(
                                now.year,
                                now.month,
                                now.day,
                                selectedTime.hour,
                                selectedTime.minute,
                              );

                              // لو الوقت المختار أقل من دلوقتي → نزوده يوم
                              if (selectedDateTime.isBefore(nowTrimmed)) {
                                selectedDateTime = selectedDateTime
                                    .add(const Duration(days: 1));
                              }

                              final duration =
                                  selectedDateTime.difference(nowTrimmed);
                              final totalMinutes = duration.inMinutes;
                              final totalHours = totalMinutes ~/ 60;
                              final remainingMinutes = totalMinutes % 60;

                              // ✅ Debug output - ممكن تحذفها بعدين
                              print('الآن (trimmed): $nowTrimmed');
                              print('الوقت المختار: $selectedDateTime');
                              print(
                                  'الفرق: $totalMinutes دقيقة ($totalHours ساعة و $remainingMinutes دقيقة)');

                              final pricePerHour = (state.spot.length > 1
                                      ? state.spot[1].reservationFees
                                      : null) ??
                                  50;
                              final totalPrice =
                                  ((totalMinutes / 60).ceil()) * pricePerHour;
                              print('selected time ${_selectedTime}');
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Time difference: $totalHours hours and $remainingMinutes minutes",
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                        fontFamily: Assets.textfamily,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "Total price: $totalPrice EGP",
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                        fontFamily: Assets.textfamily,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    if (totalMinutes < 60)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          "You must book at least 1 hour in advance.",
                                          style: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 14,
                                            fontFamily: Assets.textfamily,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            }),
                          ],
                          SizedBox(height: heaight * 0.01),
                          CustomButton(
                            width: width,
                            heaight: heaight,
                            text: 'Submit',
                            onPressed: () {
                              if (_selectedTime == null) {
                                CustomScaffoldMessenger(
                                  context,
                                  'Please select time first',
                                  FontAwesomeIcons.circleInfo,
                                  Colors.red,
                                );
                                return;
                              }

                              final DateTime unifiedNow = DateTime.now();

                              final String reserveat =
                                  formatDateTimeWithSelectedTime(
                                _selectedTime!,
                                unifiedNow,
                              );
                              print('reserveat time is  $reserveat');

                              context.read<ReserveSpotCubit>().reservespot(
                                    id: location.id.toString(),
                                    plate: _selectedPlate!,
                                    reserve_at: reserveat,
                                    token: userdata.token!,
                                  );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else if (state is GetSpotDetialsFailure) {
                CustomScaffoldMessenger(
                    context,
                    "Error is : ${state.errmessage}",
                    FontAwesomeIcons.circleXmark,
                    Colors.red);
                return Text('Failed to load data');
              } else {
                return const Center(
                  child: SpinKitFadingCircle(color: Colors.black),
                );
              }
            },
          ),
        );
      },
    );
  }
}

String formatDateTimeWithSelectedTime(TimeOfDay tod, DateTime now) {
  final trimmedNow =
      DateTime(now.year, now.month, now.day, now.hour, now.minute);

  DateTime selectedDateTime = DateTime(
    trimmedNow.year,
    trimmedNow.month,
    trimmedNow.day,
    tod.hour,
    tod.minute,
  );
  print('now: $now');
  print('trimmedNow: $trimmedNow');
  print('selectedTime: $tod');
  print('selectedDateTime before adjust: $selectedDateTime');

  if (selectedDateTime.isBefore(trimmedNow)) {
    selectedDateTime = selectedDateTime.add(const Duration(days: 1));
  }

  final year = selectedDateTime.year.toString().padLeft(4, '0');
  final month = selectedDateTime.month.toString().padLeft(2, '0');
  final day = selectedDateTime.day.toString().padLeft(2, '0');
  final hour = selectedDateTime.hour.toString().padLeft(2, '0');
  final minute = selectedDateTime.minute.toString().padLeft(2, '0');
  final second = selectedDateTime.second.toString().padLeft(2, '0');

  return "$year-$month-$day $hour:$minute:$second";
}

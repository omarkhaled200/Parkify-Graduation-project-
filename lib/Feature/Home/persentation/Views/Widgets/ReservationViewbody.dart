import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/App_Router.dart';
import 'package:parkify/Core/utlis/CustomButton.dart';
import 'package:parkify/Core/utlis/Functions/CustomScaffoldMessenger.dart';
import 'package:parkify/Core/utlis/Icon_All_app.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Reserve_Spot_Cubit/reserve_spot_cubit.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/CustomDrowdown.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/CustomTimeOfDay.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/DisplayMoneyWidget.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/ShowtheFreeandOccupiedSpot.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/TheDisplayScreen.dart';
import 'package:parkify/constant.dart';

class ReservationViewbody extends StatefulWidget {
  const ReservationViewbody({super.key, required this.userData});
  final UserModel userData;
  @override
  State<ReservationViewbody> createState() => _ReservationViewbodyState();
}

class _ReservationViewbodyState extends State<ReservationViewbody> {
  List<String> _list = [
    'Plate1',
    'Plate2',
    'Plate3',
    'Plate4',
    'Plate5',
    'Plate6',
  ];
  String? _selectedPlate = 'Plate1';

  TimeOfDay? _selectedTime; // نضيف متغير للوقت

  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<ReserveSpotCubit, ReserveSpotState>(
      listener: (context, state) {
        if (state is ReserveSpotFailure) {
          CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark);
        } else if (state is ReserveSpotSuccess) {
          CustomScaffoldMessenger(
              context, 'Success', Icons.check_circle_outline);
          GoRouter.of(context).push(AppRouter.homePageCountdown);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kprimaryColor,
            title: IconApp(width: width),
            actions: [
              DisplaymoneyWidget(
                width: width,
                price: widget.userData.userData!.balance!,
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Column(
              children: [
                SizedBox(height: heaight * 0.03),
                ShowtheFreeandOccupiedSpot(width: width, heaight: heaight),
                SizedBox(height: heaight * 0.03),
                TheDisplayScreen(
                    heaight: heaight, width: width, text: 'Screen'),
                SizedBox(height: heaight * 0.05),
                CustomDrowdown(
                  list: _list,
                  selectedPlate: _selectedPlate!,
                  text: 'Select License Plate',
                  onChanged: (selectedValue) {
                    setState(() {
                      _selectedPlate = selectedValue;
                    });
                  },
                ),
                SizedBox(height: heaight * 0.03),
                CustomTimeOfDay(
                  onTimeChanged: (TimeOfDay newTime) {
                    setState(() {
                      _selectedTime = newTime;
                    });
                  },
                ),
                SizedBox(height: heaight * 0.05),
                CustomButton(
                  width: width,
                  heaight: heaight,
                  text: 'Submit',
                  onPressed: () {
                    if (_selectedTime == null) {
                      CustomScaffoldMessenger(
                          context,
                          'Please select time first',
                          FontAwesomeIcons.circleInfo);
                      return;
                    }

                    if (state is ReserveSpotLoading) {
                      const SpinKitFadingCircle(color: Colors.black);
                    } else {
                      final String reserve_at =
                          formatDateTimeWithSelectedTime(_selectedTime!);
                      print(_selectedPlate);
                      print("the time is ${reserve_at}");
                      context.read<ReserveSpotCubit>().reservespot(
                            plate: _selectedPlate!,
                            reserve_at: reserve_at,
                            token: widget.userData.token!,
                          );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

String formatDateTimeWithSelectedTime(TimeOfDay tod) {
  final now = DateTime.now();
  final hour = tod.hour;
  final minute = tod.minute;

  // نركب التاريخ مع الوقت المختار
  final DateTime combined = DateTime(
    now.year,
    now.month,
    now.day,
    hour,
    minute,
    0, // ثواني = 0
  );

  // نحوله للشكل المطلوب
  return "${combined.year.toString().padLeft(4, '0')}-"
      "${combined.month.toString().padLeft(2, '0')}-"
      "${combined.day.toString().padLeft(2, '0')} "
      "${combined.hour.toString().padLeft(2, '0')}:"
      "${combined.minute.toString().padLeft(2, '0')}:"
      "${combined.second.toString().padLeft(2, '0')}";
}

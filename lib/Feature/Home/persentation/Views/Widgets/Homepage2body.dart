import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/Get%20user%20point%20and%20balance/User_Balance_Point_Cubit/user_balance_point_cubit.dart';
import 'package:parkify/Core/utlis/Functions/CustomScaffoldMessenger.dart';
import 'package:parkify/Core/utlis/Icon_All_app.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Home/data/Model/location_model/location_model.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/MQTT_Mange_Cubit/mqtt_cubit.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/Currentloationcard.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/CustomReserveNowButton.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/DisplayMoneyWidget.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/FreePublicParking.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/PremiumReserveSpotParking.dart';

import 'package:parkify/constant.dart';

class Homepage2body extends StatefulWidget {
  const Homepage2body({super.key});

  @override
  State<Homepage2body> createState() => _Homepage2bodyState();
}

class _Homepage2bodyState extends State<Homepage2body> {
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
    return BlocBuilder<MqttCubit, MqttState>(
      builder: (context, state) {
        if (state is MqttMessageReceived) {
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
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome ${userdata.user!.name}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: Assets.textfamily,
                        ),
                      ),
                      SizedBox(
                        height: heaight * 0.01,
                      ),
                      Text(
                        'Let’s start our journey together my friend!🚀',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: Assets.textfamily,
                        ),
                      ),
                      SizedBox(
                        height: heaight * 0.02,
                      ),
                      Currentloationcard(
                        loc: location,
                      ),
                      SizedBox(
                        height: heaight * 0.01,
                      ),
                      FreePublicParking(
                        numberSpot: state.message,
                      ),
                      SizedBox(
                        height: heaight * 0.01,
                      ),
                      PremiumReserveSpotParking(
                        numberSpot: state.message,
                      ),
                      SizedBox(
                        height: heaight * 0.02,
                      ),
                      CustomReserveNowButton(
                        loc: location,
                        width: width,
                        heaight: heaight,
                        userdata: userdata,
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        } else if (state is MqttDisconnected) {
          CustomScaffoldMessenger(
            context,
            "Error is : Mqtt Disconnected",
            FontAwesomeIcons.circleXmark,
            Colors.red,
          );
          return const Center(
            child: Text('Failed to connect'),
          );
        } else if (state is MqttError) {
          CustomScaffoldMessenger(context, "Error is : ${state.error}",
              FontAwesomeIcons.circleXmark, Colors.red);
          return const Center(
            child: Text('Failed to load data'),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: SpinKitFadingCircle(color: Colors.black),
            ),
          );
        }
      },
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/Functions/MQTT%20Service.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Home/data/Home%20Repos/Home_Repo_impl.dart';

import 'package:parkify/Feature/Home/persentation/View_Model/Cancel%20Reserve%20Cubit/cancel_reserve_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Deactivate_Blocker_Cubit/deactivate_blocker_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Get%20Active%20Reservation/get_activer_reservation_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Get%20Count%20down%20data/get_count_down_data_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Get%20location%20by%20id/get_location_by_id_cubit.dart';

import 'package:parkify/Feature/Home/persentation/View_Model/MQTT_Mange_Cubit/mqtt_cubit.dart';

import 'package:parkify/Feature/Home/persentation/Views/Widgets/HomepageCountDownbody.dart';

class HomePageCountdown extends StatelessWidget {
  const HomePageCountdown({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    var extra = GoRouterState.of(context).extra as Map<String, dynamic>;

    var userdata = extra['userdata'] as UserModel;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CancelReserveCubit(HomeRepoImpl(ApiClass(Dio()))),
        ),
        BlocProvider(
          create: (context) =>
              DeactivateBlockerCubit(HomeRepoImpl(ApiClass(Dio()))),
        ),
        BlocProvider(
          create: (context) => MqttCubit(MqttService()),
        ),
        BlocProvider(
          create: (context) =>
              GetActiverReservationCubit(HomeRepoImpl(ApiClass(Dio())))
                ..GetActiveReservation(token: userdata.token!),
        ),
        BlocProvider(
          create: (context) =>
              GetCountDownDataCubit(HomeRepoImpl(ApiClass(Dio())))
                ..getCountDowndata(token: userdata.token!),
        ),
        BlocProvider(
            create: (context) =>
                GetLocationByIdCubit(HomeRepoImpl(ApiClass(Dio())))),

        // BlocProvider(
        //   create: (context) =>
        //       GetSpotDetialsCubit(HomeRepoImpl(ApiClass(Dio())))
        //         ..getSpotDetials(token: userdata.token!),
        // ),
      ],
      child: HomepageCountDownbody(
        userdata: userdata,
      ),
    );
  }
}

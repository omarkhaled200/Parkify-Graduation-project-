import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/Get%20user%20point%20and%20balance/User_Balance_Point_Cubit/user_balance_point_cubit.dart';
import 'package:parkify/Core/Get%20user%20point%20and%20balance/User_Balance_point_Repo/User_Balance_Point_Home_Repo_impl.dart';

import 'package:parkify/Core/utlis/Functions/MQTT%20Service.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_data.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';

import 'package:parkify/Feature/Home/data/Home%20Repos/Home_Repo_impl.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Get_User_Plates/get_user_plates_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/MQTT_Mange_Cubit/mqtt_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Manage_Page/manage_page_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Reserve_Spot_Cubit/reserve_spot_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Spot%20Detials%20Cubit/Get%20Spot%20Detials/get_spot_detials_cubit.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/ReservationViewbody.dart';

class ReservationView extends StatelessWidget {
  const ReservationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var extra = GoRouterState.of(context).extra as Map<String, dynamic>;
    var userdata = extra['userdata'] as UserModel;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ReserveSpotCubit(
            HomeRepoImpl(
              ApiClass(
                Dio(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => MqttCubit(MqttService()),
        ),
        BlocProvider(
          create: (context) => GetUserPlatesCubit(HomeRepoImpl(ApiClass(Dio())))
            ..getuserplate(token: userdata.token!),
        ),
        BlocProvider(
          create: (context) => UserBalancePointCubit(
              UserBalancePointHomeRepoImpl(ApiClass(Dio())))
            ..getbalanceandpoints(token: userdata.token!),
        ),
        BlocProvider(
          create: (context) =>
              GetSpotDetialsCubit(HomeRepoImpl(ApiClass(Dio())))
                ..getSpotDetials(token: userdata.token!),
        ),
      ],
      child: const ReservationViewbody(),
    );
  }
}

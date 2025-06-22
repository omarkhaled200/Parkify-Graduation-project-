import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/Get%20user%20point%20and%20balance/User_Balance_Point_Cubit/user_balance_point_cubit.dart';
import 'package:parkify/Core/Get%20user%20point%20and%20balance/User_Balance_point_Repo/User_Balance_Point_Home_Repo_impl.dart';
import 'package:parkify/Core/utlis/Functions/MQTT%20Service.dart';
import 'package:parkify/Core/utlis/api_class.dart';

import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Home/data/Home%20Repos/Home_Repo_impl.dart';
import 'package:parkify/Feature/Home/data/Model/LocationModel/LocatiomModel.dart';

import 'package:parkify/Feature/Home/persentation/View_Model/MQTT_Mange_Cubit/mqtt_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Spot%20Detials%20Cubit/Get%20Spot%20Detials/get_spot_detials_cubit.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/Homepage2body.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    var extra = GoRouterState.of(context).extra as Map<String, dynamic>;
    var location = extra['location'] as LocationModel;
    var userdata = extra['userdata'] as UserModel;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MqttCubit(MqttService()),
        ),
        BlocProvider(
          create: (context) =>
              GetSpotDetialsCubit(HomeRepoImpl(ApiClass(Dio())))
                ..getSpotDetials(token: userdata.token!),
        ),
        BlocProvider(
          create: (context) => UserBalancePointCubit(
              UserBalancePointHomeRepoImpl(ApiClass(Dio())))
            ..getbalanceandpoints(token: userdata.token!),
        ),
      ],
      child: const Homepage2body(),
    );
  }
}

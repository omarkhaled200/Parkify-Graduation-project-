import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkify/Core/Get%20user%20point%20and%20balance/User_Balance_Point_Cubit/user_balance_point_cubit.dart';
import 'package:parkify/Core/Get%20user%20point%20and%20balance/User_Balance_point_Repo/User_Balance_Point_Home_Repo_impl.dart';
import 'package:parkify/Core/utlis/Functions/MQTT%20Service.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Home/data/Home%20Repos/Home_Repo_impl.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Get%20all%20locations/get_all_locations_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/MQTT_Mange_Cubit/mqtt_cubit.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/Homepage1body.dart';

class Homepage1 extends StatelessWidget {
  const Homepage1({super.key, required this.userdata});
  final UserModel userdata;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetAllLocationsCubit(HomeRepoImpl(ApiClass(Dio())))
                ..getAlllocation(token: userdata.token!),
        ),
        BlocProvider(
          create: (context) => MqttCubit(MqttService()),
        ),
        BlocProvider(
          create: (context) => UserBalancePointCubit(
              UserBalancePointHomeRepoImpl(ApiClass(Dio())))
            ..getbalanceandpoints(token: userdata.token!),
        ),
      ],
      child: Homepage1body(
        userdata: userdata,
      ),
    );
  }
}

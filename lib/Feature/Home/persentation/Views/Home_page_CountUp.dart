import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Home/data/Home%20Repos/Home_Repo_impl.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Cancel%20Reserve%20Cubit/cancel_reserve_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Deactivate_Blocker_Cubit/deactivate_blocker_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Get%20Active%20Reservation/get_activer_reservation_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Get%20count%20up%20data/get_count_up_data_cubit.dart';

import 'package:parkify/Feature/Home/persentation/Views/Widgets/HomePageCountupbody.dart';

class HomePageCountup extends StatelessWidget {
  const HomePageCountup({super.key, required this.userdata});
  final UserModel userdata;
  @override
  Widget build(BuildContext context) {
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
          create: (context) =>
              GetActiverReservationCubit(HomeRepoImpl(ApiClass(Dio())))
                ..GetActiveReservation(token: userdata.token!),
        ),
        BlocProvider(
          create: (context) =>
              GetActiverReservationCubit(HomeRepoImpl(ApiClass(Dio())))
                ..GetActiveReservation(token: userdata.token!),
        ),
        BlocProvider(
          create: (context) =>
              GetCountUpDataCubit(HomeRepoImpl(ApiClass(Dio())))
                ..getCountUpdata(token: userdata.token!),
        ),
      ],
      child: HomePageCountupbody(
        userdata: userdata,
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Home/data/Repos/Home_Repo_impl.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Reserve_Spot_Cubit/reserve_spot_cubit.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/ReservationViewbody.dart';

class ReservationView extends StatelessWidget {
  const ReservationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var userdata = GoRouterState.of(context).extra as UserModel;
    return BlocProvider(
      create: (context) => ReserveSpotCubit(
        HomeRepoImpl(
          ApiClass(
            Dio(),
          ),
        ),
      ),
      child: ReservationViewbody(
        userData: userdata,
      ),
    );
  }
}

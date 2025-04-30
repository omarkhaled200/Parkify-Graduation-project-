import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Home/data/Repos/Home_Repo_impl.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Cancel%20Reserve%20Cubit/cancel_reserve_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Deactivate_Blocker_Cubit/deactivate_blocker_cubit.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/HomepageCountDownbody.dart';

class HomePageCountdown extends StatelessWidget {
  const HomePageCountdown({super.key});

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
      ],
      child: const HomepageCountDownbody(),
    );
  }
}

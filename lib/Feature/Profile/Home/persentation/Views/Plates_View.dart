import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Profile/Home/data/Repos/Home_Repo_impl.dart';
import 'package:parkify/Feature/Profile/Home/persentation/View_Model/Get_User_Plates/get_user_plates_cubit.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/Plates_View_Body.dart';

class PlatesView extends StatelessWidget {
  const PlatesView({super.key});

  @override
  Widget build(BuildContext context) {
    var token = GoRouterState.of(context).extra as String;
    return BlocProvider(
      create: (context) =>
          GetUserPlatesCubit(profileHomeRepoImpl(ApiClass(Dio())))
            ..getuserplate(token: token),
      child: const PlatesViewBody(),
    );
  }
}

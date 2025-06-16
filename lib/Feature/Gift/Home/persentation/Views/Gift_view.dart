import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkify/Core/Get%20user%20point%20and%20balance/User_Balance_Point_Cubit/user_balance_point_cubit.dart';
import 'package:parkify/Core/Get%20user%20point%20and%20balance/User_Balance_point_Repo/User_Balance_Point_Home_Repo_impl.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Gift/Home/persentation/View_Model/handel%20gift/handel_gift_cubit.dart';
import 'package:parkify/Feature/Gift/Home/persentation/Views/Widgets/GiftViewBody.dart';

class GiftView extends StatelessWidget {
  const GiftView({super.key, required this.userdata});
  final UserModel userdata;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBalancePointCubit(
              UserBalancePointHomeRepoImpl(ApiClass(Dio())))
            ..getbalanceandpoints(token: userdata.token!),
        ),
        BlocProvider(
          create: (context) => GiftSelectionCubit(),
        ),
      ],
      child: GiftViewBody(
        user: userdata,
      ),
    );
  }
}

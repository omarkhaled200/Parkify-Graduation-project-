import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Profile/Home/data/Repos/Home_Repo_impl.dart';
import 'package:parkify/Feature/Profile/Home/persentation/View_Model/Get_Public_Spot_History/get_public_spot_history_cubit.dart';
import 'package:parkify/Feature/Profile/Home/persentation/View_Model/Get_Reserved_Spot_History/get_reserved_spot_history_cubit.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/HistoryViewbody.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key, required this.token});
  final String token;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final cubit =
                GetPublicSpotHistoryCubit(profileHomeRepoImpl(ApiClass(Dio())));
            cubit.GetPublicspot(token: token);
            return cubit;
          },
        ),
        BlocProvider(
          create: (context) {
            final cubit = GetReservedSpotHistoryCubit(
                profileHomeRepoImpl(ApiClass(Dio())));
            cubit.GetREservedspot(token: token);
            return cubit;
          },
        ),
      ],
      child: HistoryViewbody(token: token),
    );
  }
}

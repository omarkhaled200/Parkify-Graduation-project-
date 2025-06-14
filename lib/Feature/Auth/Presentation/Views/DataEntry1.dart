import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Auth/Presentation/View_Model/Setup_User_Data_Cubit/setup_user_data_cubit.dart';
import 'package:parkify/Feature/Auth/Presentation/Views/Widgets/Dateentry1body.dart';
import 'package:parkify/Feature/Auth/data/Repos/Home_Repo_impl.dart';

class Dataentry1 extends StatelessWidget {
  const Dataentry1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetupUserDataCubit(
        HomeRepoImpl(
          ApiClass(
            Dio(),
          ),
        ),
      ),
      child: const Dateentry1body(),
    );
  }
}

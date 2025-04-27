import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Auth/Presentation/View_Model/User_login_toAccount_Cubit/user_login_to_account_cubit.dart';
import 'package:parkify/Feature/Auth/Presentation/Views/Widgets/login_view_body.dart';
import 'package:parkify/Feature/Auth/data/Repos/Home_Repo_impl.dart';

class Loginview extends StatelessWidget {
  const Loginview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserLoginToAccountCubit(HomeRepoImpl(ApiClass(Dio()))),
      child: const LoginViewBody(),
    );
  }
}

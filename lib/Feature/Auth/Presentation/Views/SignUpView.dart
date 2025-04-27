import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Auth/Presentation/View_Model/User_Register_New_Account_cubit/user_register_new_account_cubit.dart';
import 'package:parkify/Feature/Auth/Presentation/View_Model/User_login_toAccount_Cubit/user_login_to_account_cubit.dart';
import 'package:parkify/Feature/Auth/Presentation/Views/Widgets/Signup_view_body.dart';
import 'package:parkify/Feature/Auth/data/Repos/Home_Repo_impl.dart';

class Signupview extends StatelessWidget {
  const Signupview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserRegisterNewAccountCubit(HomeRepoImpl(ApiClass(Dio()))),
      child: const Signupviewbody(),
    );
  }
}

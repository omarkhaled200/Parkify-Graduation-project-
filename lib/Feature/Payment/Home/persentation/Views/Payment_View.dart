import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkify/Core/Get%20user%20point%20and%20balance/User_Balance_Point_Cubit/user_balance_point_cubit.dart';
import 'package:parkify/Core/Get%20user%20point%20and%20balance/User_Balance_point_Repo/User_Balance_Point_Home_Repo_impl.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Payment/Home/data/Repo/Home_Repo_impl.dart';
import 'package:parkify/Feature/Payment/Home/persentation/View_Model/Get_Transaction_History/get_transaction_history_cubit.dart';
import 'package:parkify/Feature/Payment/Home/persentation/View_Model/Post_Payment_Cubit/post_payment_cubit.dart';
import 'package:parkify/Feature/Payment/Home/persentation/Views/Widgets/PaymentViewbody.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PostPaymentCubit(HomeRepoImpl(ApiClass(Dio()))),
        ),
        BlocProvider(
          create: (context) =>
              GetTransactionHistoryCubit(HomeRepoImpl(ApiClass(Dio())))
                ..getTransactionHistory(token: user.token!),
        ),
        BlocProvider(
          create: (context) => UserBalancePointCubit(
              UserBalancePointHomeRepoImpl(ApiClass(Dio())))
            ..getbalanceandpoints(token: user.token!),
        ),
      ],
      child: PaymentViewbody(
        user: user,
      ),
    );
  }
}

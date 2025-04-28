import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Payment/Home/data/Repo/Home_Repo_impl.dart';
import 'package:parkify/Feature/Payment/Home/persentation/View_Model/Post_Payment_Cubit/post_payment_cubit.dart';
import 'package:parkify/Feature/Payment/Home/persentation/Views/Widgets/BottomSheetbody.dart';

class BottomSheetView extends StatelessWidget {
  const BottomSheetView({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostPaymentCubit(HomeRepoImpl(ApiClass(Dio()))),
      child: BottomSheetbody(
        token: token,
      ),
    );
  }
}

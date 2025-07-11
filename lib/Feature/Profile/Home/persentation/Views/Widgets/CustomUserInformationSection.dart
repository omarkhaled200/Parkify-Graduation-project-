import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/App_Router.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Auth/Presentation/View_Model/User_Logout_Account_Cubit/user_logout_account_cubit.dart';
import 'package:parkify/Feature/Auth/data/Repos/Home_Repo_impl.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/CustomLogOutbutton.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/CustomViewHistoryBtn.dart';

class CustomUserInformationSection extends StatelessWidget {
  const CustomUserInformationSection({
    super.key,
    required this.width,
    required this.heaight,
    required this.token,
  });

  final double width;
  final double heaight;
  final String token;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: heaight * 0.01,
        ),
        CustomViewHistoryBtn(
          width: width,
          heaight: heaight,
          text: 'View History',
          onpressed: () {
            GoRouter.of(context).push(AppRouter.Historypage, extra: token);
          },
        ),
        SizedBox(
          height: heaight * 0.01,
        ),
        CustomViewHistoryBtn(
          width: width,
          heaight: heaight,
          text: 'My Plates',
          onpressed: () {
            GoRouter.of(context).push(AppRouter.platespage, extra: token);
          },
        ),
        SizedBox(
          height: heaight * 0.01,
        ),
        CustomViewHistoryBtn(
          icon: FontAwesomeIcons.language,
          width: width,
          heaight: heaight,
          text: "Language",
          onpressed: () {
            GoRouter.of(context).push(AppRouter.languagepage, extra: token);
          },
        ),
        SizedBox(
          height: heaight * 0.01,
        ),
        CustomViewHistoryBtn(
          icon: Icons.info,
          width: width,
          heaight: heaight,
          text: 'About Us',
          onpressed: () {},
        ),
        SizedBox(
          height: heaight * 0.01,
        ),
        BlocProvider(
          create: (context) =>
              UserLogoutAccountCubit(AuthHomeRepoImpl(ApiClass(Dio()))),
          child: CustomLogOutbutton(
            heaight: heaight,
            token: token,
          ),
        ),
      ],
    );
  }
}

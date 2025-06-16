import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/App_Router.dart';
import 'package:parkify/Core/utlis/Functions/CustomScaffoldMessenger.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Auth/Presentation/View_Model/User_Logout_Account_Cubit/user_logout_account_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/BottomNavCubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomLogOutbutton extends StatelessWidget {
  const CustomLogOutbutton({
    super.key,
    required this.heaight,
    required this.token,
  });

  final double heaight;
  final String token;
  Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // يمسح كل البيانات المحفوظة
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserLogoutAccountCubit, UserLogoutAccountState>(
      listener: (context, state) async {
        if (state is UserLogoutAccountFailure) {
          CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark, Colors.red);
        } else if (state is UserLogoutAccountSuccess) {
          await clearUserData();
          CustomScaffoldMessenger(
              context, 'Success', Icons.check_circle_outline, Colors.green);
          context.read<BottomNavCubit>().setPage(0);

          GoRouter.of(context).go(AppRouter.loginview);
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            context.read<UserLogoutAccountCubit>().logout(token: token);
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            height: heaight * 0.1,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(400),
                bottomRight: Radius.circular(400),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Logout',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: Assets.textfamily),
                ),
                const Icon(
                  Icons.exit_to_app_rounded,
                  size: 24,
                  color: Colors.white,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

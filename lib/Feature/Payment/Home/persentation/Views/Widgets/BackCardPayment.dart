import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify/Core/Get%20user%20point%20and%20balance/User_Balance_Point_Cubit/user_balance_point_cubit.dart';
import 'package:parkify/Core/utlis/Functions/CustomScaffoldMessenger.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';

class BackCardPayment extends StatelessWidget {
  const BackCardPayment({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<UserBalancePointCubit, UserBalancePointState>(
      builder: (context, state) {
        if (state is UserBalancePointSuccess) {
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: heaight * 0.3,
              width: width,
              child: Card(
                  color: Color(0xff3F3F3F),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        child: Container(
                            height: heaight * 0.4,
                            width: width * 0.65,
                            decoration: BoxDecoration(
                              color: const Color(0xff2F2C2C),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(width * 0.35),
                                bottomRight: Radius.circular(width * 0.35),
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Parkify',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      Assets.Visa,
                                      height: heaight * 0.06,
                                      width: width * 0.1,
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Image.asset(
                                      Assets.Mastercard,
                                      height: heaight * 0.06,
                                      width: width * 0.1,
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Image.asset(
                                      Assets.Meza,
                                      height: heaight * 0.06,
                                      width: width * 0.1,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: heaight * 0.03,
                            ),
                            Center(
                              child: Text(
                                'Total Balance',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Assets.textfamily),
                              ),
                            ),
                            SizedBox(
                              height: heaight * 0.01,
                            ),
                            Center(
                              child: Text(
                                '${state.value.balance}\$',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Assets.textfamily),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ));
        } else if (state is UserBalancePointFailure) {
          CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark, Colors.red);
          return Text('Failed to load balance');
        } else {
          return const Center(
            child: SpinKitFadingCircle(color: Colors.black),
          );
        }
      },
    );
  }
}

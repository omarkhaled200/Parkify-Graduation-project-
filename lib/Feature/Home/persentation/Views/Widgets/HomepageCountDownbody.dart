import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify/Core/utlis/CustomButton.dart';
import 'package:parkify/Core/utlis/Functions/CustomScaffoldMessenger.dart';
import 'package:parkify/Core/utlis/Icon_All_app.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Cancel%20Reserve%20Cubit/cancel_reserve_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Deactivate_Blocker_Cubit/deactivate_blocker_cubit.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/CountdownTimerScreen.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/DisplayMoneyWidget.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/ShowtheFreeandOccupiedSpot.dart';
import 'package:parkify/constant.dart';

class HomepageCountDownbody extends StatelessWidget {
  const HomepageCountDownbody({super.key});

  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kprimaryColor,
        title: IconApp(width: width),
        actions: [
          DisplaymoneyWidget(
            width: width,
            price: 200,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Omar Khaled',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: Assets.textfamily,
              ),
            ),
            SizedBox(
              height: heaight * 0.03,
            ),
            ShowtheFreeandOccupiedSpot(width: width, heaight: heaight),
            SizedBox(
              height: heaight * 0.03,
            ),
            Text(
              'You Have a Reservation At 2:00 PM At Spot 1',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontFamily: Assets.textfamily,
              ),
            ),
            SizedBox(
              height: heaight * 0.03,
            ),
            CountdownTimerScreen(),
            SizedBox(
              height: heaight * 0.03,
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: BlocConsumer<DeactivateBlockerCubit,
                        DeactivateBlockerState>(
                      listener: (context, state) {
                        if (state is DeactivateBlockerFailure) {
                          CustomScaffoldMessenger(
                              context,
                              "Error is : ${state.errmessage}",
                              FontAwesomeIcons.circleXmark);
                        } else if (state is DeactivateBlockerSuccess) {
                          CustomScaffoldMessenger(context, state.output,
                              Icons.check_circle_outline);
                        }
                      },
                      builder: (context, state) {
                        return CustomButton(
                          width: width,
                          heaight: heaight,
                          text: 'Blocker ⬇',
                          onPressed: () {
                            context
                                .read<DeactivateBlockerCubit>()
                                .deactivateReservationBlocker(token: 'Token');
                          },
                        );
                      },
                    )),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                    flex: 1,
                    child: BlocConsumer<CancelReserveCubit, CancelReserveState>(
                      listener: (context, state) {
                        if (state is CancelReserveFailure) {
                          CustomScaffoldMessenger(
                              context,
                              "Error is : ${state.errmessage}",
                              FontAwesomeIcons.circleXmark);
                        } else if (state is CancelReserveSuccess) {
                          CustomScaffoldMessenger(context, state.reserve,
                              Icons.check_circle_outline);
                        }
                      },
                      builder: (context, state) {
                        return CustomButton(
                          width: width,
                          heaight: heaight,
                          text: 'Cancel',
                          onPressed: () {
                            context
                                .read<CancelReserveCubit>()
                                .cancelReservation(token: "token");
                          },
                        );
                      },
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

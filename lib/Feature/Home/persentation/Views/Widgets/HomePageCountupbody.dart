import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/App_Router.dart';

import 'package:parkify/Core/utlis/CustomButton.dart';
import 'package:parkify/Core/utlis/Functions/CustomScaffoldMessenger.dart';
import 'package:parkify/Core/utlis/Icon_All_app.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Home/data/Home%20Repos/Home_Repo_impl.dart';
import 'package:parkify/Feature/Home/data/Model/location_model/location_model.dart';

import 'package:parkify/Feature/Home/persentation/View_Model/BottomNavCubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Cancel%20Reserve%20Cubit/cancel_reserve_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Deactivate_Blocker_Cubit/deactivate_blocker_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Get%20Active%20Reservation/get_activer_reservation_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Get%20count%20up%20data/get_count_up_data_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Get%20location%20by%20id/get_location_by_id_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Manage_Page/manage_page_cubit.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/Countdowndetailsdata.dart';

import 'package:parkify/Feature/Home/persentation/Views/Widgets/Curretnlocationbyid.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/DisplayMoneyWidget.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/ProgressiveTimer(Countup).dart';

import 'package:parkify/constant.dart';

class HomePageCountupbody extends StatefulWidget {
  const HomePageCountupbody({super.key, required this.userdata});
  final UserModel userdata;

  @override
  State<HomePageCountupbody> createState() => _HomePageCountupbodyState();
}

class _HomePageCountupbodyState extends State<HomePageCountupbody> {
  LocationModel locationName = LocationModel();
  @override
  Widget build(BuildContext context) {
    print('the key is :${widget.userdata.token}');
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kprimaryColor,
        title: IconApp(width: width),
        actions: [
          DisplaymoneyWidget(
            width: width,
            price: widget.userdata.userData!.balance!,
          )
        ],
      ),
      body: BlocBuilder<GetActiverReservationCubit, GetActiverReservationState>(
        builder: (context, state) {
          if (state is GetActiverReservatioSuccess) {
            return Padding(
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
                    height: heaight * 0.02,
                  ),
                  BlocProvider(
                    create: (context) =>
                        GetLocationByIdCubit(HomeRepoImpl(ApiClass(Dio())))
                          ..getlocationbyid(
                              token: widget.userdata.token!,
                              id: state.reservation.reservableSpotId!),
                    child: Currentloationcardbyid(
                      user: widget.userdata,
                    ),
                  ),
                  SizedBox(
                    height: heaight * 0.01,
                  ),
                  Countdowndetailsdata(reservtionModel: state.reservation),
                  SizedBox(
                    height: heaight * 0.03,
                  ),
                  BlocBuilder<GetCountUpDataCubit, GetCountUpDataState>(
                    builder: (context, state) {
                      if (state is GetCountUpDataSuccess) {
                        return ProgressiveTimer(
                          second: state.countupdata.sec!,
                          minute: state.countupdata.min!,
                          hour: state.countupdata.hour!,
                        );
                      } else if (state is GetCountUpDataFailure) {
                        CustomScaffoldMessenger(
                            context,
                            "Error is : ${state.errmessage}",
                            FontAwesomeIcons.circleXmark,
                            Colors.red);
                        return SizedBox.shrink();
                      } else {
                        return const SpinKitFadingCircle(
                          color: Colors.black,
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: heaight * 0.03,
                  ),
                  BlocProvider(
                    create: (context) =>
                        GetLocationByIdCubit(HomeRepoImpl(ApiClass(Dio())))
                          ..getlocationbyid(
                              token: widget.userdata.token!,
                              id: state.reservation.reservableSpotId!),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              BlocBuilder<GetLocationByIdCubit,
                                      GetLocationByIdState>(
                                  builder: (context, state) {
                                final locationState =
                                    context.watch<GetLocationByIdCubit>().state;

                                if (locationState is GetLocationByIdSuccess) {
                                  locationName = locationState.location;
                                  return SizedBox.shrink();
                                } else if (state is GetLocationByIdFailure) {
                                  return Text("Failed to load location");
                                } else {
                                  return SizedBox.shrink();
                                }
                              }),
                              BlocConsumer<DeactivateBlockerCubit,
                                  DeactivateBlockerState>(
                                listener: (context, state) {
                                  if (state is DeactivateBlockerFailure) {
                                    CustomScaffoldMessenger(
                                      context,
                                      "Error is : ${state.errmessage}",
                                      FontAwesomeIcons.circleXmark,
                                      Colors.red,
                                    );
                                  } else if (state
                                      is DeactivateBlockerSuccess) {
                                    CustomScaffoldMessenger(
                                      context,
                                      state.output,
                                      Icons.check_circle_outline,
                                      Colors.green,
                                    );
                                  }
                                },
                                builder: (context, state) {
                                  return state is DeactivateBlockerLoading
                                      ? const SpinKitFadingCircle(
                                          color: Colors.black)
                                      : CustomButton(
                                          width: width,
                                          heaight: heaight,
                                          text: 'Blocker ⬇',
                                          onPressed: () {
                                            context
                                                .read<DeactivateBlockerCubit>()
                                                .deactivateReservationBlocker(
                                                  location: locationName.name!,
                                                  token: widget.userdata.token!,
                                                );
                                          },
                                        );
                                },
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            flex: 1,
                            child: BlocConsumer<CancelReserveCubit,
                                CancelReserveState>(
                              listener: (context, state) async {
                                if (state is CancelReserveFailure) {
                                  CustomScaffoldMessenger(
                                      context,
                                      "Error is : ${state.errmessage}",
                                      FontAwesomeIcons.circleXmark,
                                      Colors.red);
                                } else if (state is CancelReserveSuccess) {
                                  await context
                                      .read<ManagePageCubit>()
                                      .cancel();
                                  CustomScaffoldMessenger(
                                      context,
                                      state.reserve,
                                      Icons.check_circle_outline,
                                      Colors.green);
                                  GoRouter.of(context).pushReplacement(
                                      AppRouter.bottomNaviagationBar,
                                      extra: widget.userdata);
                                  context.read<BottomNavCubit>().setPage(0);
                                }
                              },
                              builder: (context, state) {
                                return state is CancelReserveLoading
                                    ? const SpinKitFadingCircle(
                                        color: Colors.black,
                                      )
                                    : CustomButton(
                                        width: width,
                                        heaight: heaight,
                                        text: 'Cancel',
                                        onPressed: () {
                                          context
                                              .read<CancelReserveCubit>()
                                              .cancelReservation(
                                                  token:
                                                      widget.userdata.token!);
                                        },
                                      );
                              },
                            )),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else if (state is GetActiverReservationFailure) {
            CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
                FontAwesomeIcons.circleXmark, Colors.red);
            return const Center(child: Text('Faild to load data'));
          } else {
            return const SpinKitFadingCircle(
              color: Colors.black,
            );
          }
        },
      ),
    );
  }
}

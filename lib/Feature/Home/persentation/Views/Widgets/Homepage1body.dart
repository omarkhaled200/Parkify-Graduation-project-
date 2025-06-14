import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/Get%20user%20point%20and%20balance/User_Balance_Point_Cubit/user_balance_point_cubit.dart';
import 'package:parkify/Core/utlis/App_Router.dart';
import 'package:parkify/Core/utlis/Functions/CustomScaffoldMessenger.dart';

import 'package:parkify/Core/utlis/Icon_All_app.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Get%20all%20locations/get_all_locations_cubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/MQTT_Mange_Cubit/mqtt_cubit.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/CustomLocationCard.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/DisplayMoneyWidget.dart';
import 'package:parkify/constant.dart';

class Homepage1body extends StatefulWidget {
  const Homepage1body({super.key, required this.userdata});
  final UserModel userdata;

  @override
  State<Homepage1body> createState() => _Homepage1bodyState();
}

class _Homepage1bodyState extends State<Homepage1body> {
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kprimaryColor,
        title: IconApp(width: width),
        actions: [
          BlocBuilder<UserBalancePointCubit, UserBalancePointState>(
            builder: (context, state) {
              if (state is UserBalancePointSuccess) {
                return DisplaymoneyWidget(
                  width: width,
                  price: state.value.balance!,
                );
              } else if (state is UserBalancePointFailure) {
                CustomScaffoldMessenger(
                    context,
                    "Error is : ${state.errmessage}",
                    FontAwesomeIcons.circleXmark,
                    Colors.red);
                return Text('Failed to load balance');
              } else {
                return const Center(
                  child: SpinKitFadingCircle(color: Colors.black),
                );
              }
            },
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: heaight * 0.01,
              ),
              Text(
                "Select the Parking",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: Assets.textfamily,
                ),
              ),
              SizedBox(
                height: heaight * 0.02,
              ),
              Expanded(
                child: BlocBuilder<GetAllLocationsCubit, GetAllLocationsState>(
                  builder: (context, state) {
                    if (state is GetAllLocationsSuccess) {
                      return ListView.builder(
                          controller: controller,
                          itemCount: state.location.length,
                          itemBuilder: (context, index) {
                            return AnimatedBuilder(
                              animation: controller,
                              builder: (context, child) {
                                double offset = 0;
                                if (controller.hasClients) {
                                  offset = controller.offset / 65 - index;
                                }
                                offset = offset.clamp(0, 3);
                                return Transform.scale(
                                  scale: 1 - (offset * 0.2),
                                  child: GestureDetector(
                                      onTap: () {
                                        context.read<MqttCubit>().connect(
                                              server:
                                                  '9bc5584a65f949e38d5b271a699d2084.s1.eu.hivemq.cloud',
                                              port: 8883,
                                              clientId:
                                                  'flutterClientId${state.location[index].name}',
                                              topic:
                                                  'garage/${state.location[index].name}/available_spots',
                                              username: 'iotwebconnection',
                                              password: 'iotwebConnection1',
                                            );
                                        GoRouter.of(context)
                                            .push(AppRouter.Homepage2, extra: {
                                          'userdata': widget.userdata,
                                          'location': state.location[index]
                                        });
                                      },
                                      child: CustomLocationCard(
                                        loc: state.location[index],
                                      )),
                                );
                              },
                            );
                          });
                    } else if (state is GetAllLocationsFailure) {
                      CustomScaffoldMessenger(
                          context,
                          "Error is : ${state.errmessage}",
                          FontAwesomeIcons.circleXmark,
                          Colors.red);
                      return const Center(
                        child: Text('Failed to load users'),
                      );
                    } else {
                      return const Center(
                        child: SpinKitFadingCircle(color: Colors.black),
                      );
                    }
                  },
                ),
              ),
            ],
          )),
    );
  }
}

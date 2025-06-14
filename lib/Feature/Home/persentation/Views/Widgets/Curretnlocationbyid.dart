import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:parkify/Core/utlis/Functions/custom_lunch_url.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';

import 'package:parkify/Feature/Home/persentation/View_Model/Get%20location%20by%20id/get_location_by_id_cubit.dart';

class Currentloationcardbyid extends StatelessWidget {
  const Currentloationcardbyid({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    print('the key is ${user.token}');
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade300, width: 1)),
      child: BlocBuilder<GetLocationByIdCubit, GetLocationByIdState>(
        builder: (context, state) {
          if (state is GetLocationByIdSuccess) {
            return Padding(
              padding: const EdgeInsetsGeometry.symmetric(
                  horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color(0xffDBEAFE),
                            borderRadius: BorderRadius.circular(24)),
                        child: const Icon(
                          Icons.location_on_outlined,
                          color: Colors.blue,
                          size: 32,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Current Location',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontFamily: Assets.textfamily,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '${state.location.name}',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: Assets.textfamily,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      customLaunchUrl(context, state.location.gpsLocation);
                    },
                    child: Row(
                      children: [
                        const Icon(FontAwesomeIcons.arrowUpRightFromSquare),
                        SizedBox(
                          width: width * 0.01,
                        ),
                        Text(
                          'View',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: Assets.textfamily,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else if (state is GetLocationByIdFailure) {
            // CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
            //     FontAwesomeIcons.circleXmark, Colors.red);
            print('the error is ${state.errmessage}');
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

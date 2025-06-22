import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify/Core/utlis/Functions/CustomScaffoldMessenger.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Home/data/Model/LocationModel/LocatiomModel.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Spot%20Detials%20Cubit/Get%20Spot%20Detials/get_spot_detials_cubit.dart';
import 'package:parkify/constant.dart';

class TheDisplayScreen extends StatelessWidget {
  const TheDisplayScreen({
    super.key,
    required this.heaight,
    required this.width,
    required this.loc,
  });

  final double heaight;
  final double width;
  final LocationModel loc;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSpotDetialsCubit, GetSpotDetialsState>(
      builder: (context, state) {
        if (state is GetSpotDetialsSuccess) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: heaight * 0.2,
            width: width,
            decoration: BoxDecoration(
              color: kprimaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Location: ${loc.name} ",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    fontFamily: Assets.textfamily,
                  ),
                ),
                Text(
                  "Price Per Hour: ${state.spot[1].pricePerHour} EGP",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    fontFamily: Assets.textfamily,
                  ),
                ),
                Text(
                  "Reservation Fees: ${state.spot[1].reservationFees} EGP",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    fontFamily: Assets.textfamily,
                  ),
                ),
                Text(
                  "Time Restriction: ${state.spot[1].timeRestriction} Minutes",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    fontFamily: Assets.textfamily,
                  ),
                ),
              ],
            ),
          );
        } else if (state is GetSpotDetialsFailure) {
          CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark, Colors.red);
          return const Center(
            child: Text('Failed to load data'),
          );
        } else {
          return const Center(
            child: SpinKitFadingCircle(color: Colors.black),
          );
        }
      },
    );
  }
}

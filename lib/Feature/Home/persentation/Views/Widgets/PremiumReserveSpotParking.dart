import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify/Core/utlis/Functions/CustomScaffoldMessenger.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Spot%20Detials%20Cubit/Get%20Spot%20Detials/get_spot_detials_cubit.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/CustomTypeAvailabilitySpot.dart';

class PremiumReserveSpotParking extends StatelessWidget {
  PremiumReserveSpotParking({super.key, required this.numberSpot});
  final String numberSpot;

  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> parts = numberSpot.split(' ');

    int freeReservable = int.parse(parts[1]);

    return BlocBuilder<GetSpotDetialsCubit, GetSpotDetialsState>(
      builder: (context, state) {
        if (state is GetSpotDetialsSuccess) {
          return Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade300, width: 1)),
            child: Padding(
              padding: const EdgeInsetsGeometry.symmetric(
                  horizontal: 12, vertical: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomTypeAvailabilitySpot(
                        color: Colors.red,
                        text: 'Premium Reserve',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey.shade800,
                          ),
                          SizedBox(
                            width: width * 0.2,
                            child: Text(
                              '$freeReservable Available',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: Assets.textfamily,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: heaight * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            color: Colors.grey.shade800,
                          ),
                          Text(
                            ' Hourly Rate',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: Assets.textfamily,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '\$ ${state.spot[1].pricePerHour}',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: Assets.textfamily,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: heaight * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            color: Colors.grey.shade800,
                          ),
                          Text(
                            ' Advance Booking',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: Assets.textfamily,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          '${state.spot[1].timeRestriction} min before',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: Assets.textfamily,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: heaight * 0.02,
                  ),
                  Divider(
                    indent: 10,
                    endIndent: 10,
                    color: Colors.grey.shade200,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Booking Fee',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: Assets.textfamily,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '\$${state.spot[1].reservationFees}',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: Assets.textfamily,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
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
